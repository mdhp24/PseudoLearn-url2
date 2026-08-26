<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\User;
use App\Models\Mahasiswa;
use App\Models\BankSoalKonversi;
use App\Models\LogUjianKode;
use Illuminate\Support\Facades\DB;

class UjianKodeLoggingAndValidationTest extends TestCase
{
    protected function setUp(): void
    {
        parent::setUp();
        $this->withoutMiddleware();
    }

    /**
     * Test 1: Simulasikan pencatatan logDrag dengan payload lengkap
     * Pastikan tersimpan 1:1 di database dengan field yang valid.
     */
    public function test_log_drag_records_single_event_accurately()
    {
        $mahasiswa = Mahasiswa::first();
        if (!$mahasiswa) {
            $this->markTestSkipped('Mahasiswa data not found');
        }

        $user = User::find($mahasiswa->id_user);
        if (!$user) {
            $this->markTestSkipped('User data not found');
        }

        $bsk = BankSoalKonversi::first();
        if (!$bsk) {
            $this->markTestSkipped('BankSoalKonversi data not found');
        }

        $initialCount = LogUjianKode::whereIn('id_mahasiswa', [$mahasiswa->id, $mahasiswa->id_user])->count();

        $response = $this->actingAs($user)->postJson('/ujian-kode/log-drag', [
            'id_bank_soal_konversi' => $bsk->id,
            'id_soal'               => $bsk->id_soal,
            'id_level'              => $bsk->id_level,
            'block_id'              => 'block-test-1',
            'item_text'             => 'int harga_dasar;',
            'index'                 => 2,
            'is_correct'            => 1,
            'waktu'                 => 15,
        ]);

        $response->assertStatus(200);
        $response->assertJson(['success' => true]);

        $newCount = LogUjianKode::whereIn('id_mahasiswa', [$mahasiswa->id, $mahasiswa->id_user])->count();
        $this->assertEquals($initialCount + 1, $newCount, 'Setiap logDrag harus menambah tepat 1 record di DB.');

        // Cleanup log test
        LogUjianKode::where('block_id', 'block-test-1')->delete();
    }

    /**
     * Test 2: Simulasikan 6x interaksi drag & drop berturut-turut
     * (3x drop salah, 2x drop benar, 1x drag reorder)
     * Verifikasi total counter bertambah tepat 6 tanpa ada yang hilang.
     */
    public function test_log_drag_accumulation_counter_lossless()
    {
        $mahasiswa = Mahasiswa::first();
        $user = User::find($mahasiswa->id_user);
        $bsk = BankSoalKonversi::first();

        if (!$user || !$bsk) {
            $this->markTestSkipped('TestData unavailable');
        }

        $initialCount = LogUjianKode::whereIn('id_mahasiswa', [$mahasiswa->id, $user->id])->count();

        // 3x drop salah
        for ($i = 1; $i <= 3; $i++) {
            $this->actingAs($user)->postJson('/ujian-kode/log-drag', [
                'id_bank_soal_konversi' => $bsk->id,
                'block_id'              => "block-salah-$i",
                'item_text'             => "salah_$i",
                'index'                 => $i,
                'is_correct'            => 0,
            ]);
        }

        // 2x drop benar
        for ($i = 1; $i <= 2; $i++) {
            $this->actingAs($user)->postJson('/ujian-kode/log-drag', [
                'id_bank_soal_konversi' => $bsk->id,
                'block_id'              => "block-benar-$i",
                'item_text'             => "benar_$i",
                'index'                 => $i + 3,
                'is_correct'            => 1,
            ]);
        }

        // 1x drag reorder
        $this->actingAs($user)->postJson('/ujian-kode/log-drag', [
            'id_bank_soal_konversi' => $bsk->id,
            'block_id'              => "block-reorder-1",
            'item_text'             => "reorder_1",
            'index'                 => 6,
            'is_correct'            => 1,
        ]);

        $finalCount = LogUjianKode::whereIn('id_mahasiswa', [$mahasiswa->id, $user->id])->count();
        $this->assertEquals($initialCount + 6, $finalCount, 'Counter akumulasi 6x aksi harus bertambah tepat 6 (lossless).');

        // Cleanup
        LogUjianKode::whereIn('block_id', [
            'block-salah-1', 'block-salah-2', 'block-salah-3',
            'block-benar-1', 'block-benar-2', 'block-reorder-1'
        ])->delete();
    }

    /**
     * Test 3: Verifikasi 1:1 Sinkronisasi antara Kartu Summary dan Per-Soal Detail
     */
    public function test_log_ujian_kode_summary_matches_table_detail_aggregate()
    {
        $mahasiswa = Mahasiswa::where('name', 'like', '%Testing%')->first() ?: Mahasiswa::first();
        if (!$mahasiswa) {
            $this->markTestSkipped('Mahasiswa not found');
        }

        $ids = array_filter([$mahasiswa->id, $mahasiswa->id_user]);

        $totalDragCard = DB::table('log_ujian_kode')
            ->whereIn('id_mahasiswa', $ids)
            ->whereNull('deleted_at')
            ->count();

        $soalRows = DB::table('ujian_kode as uk')
            ->leftJoin('bank_soal_konversi as bsk', 'uk.id_bank_soal_konversi', '=', 'bsk.id')
            ->select('uk.id_bank_soal_konversi', 'bsk.id_soal')
            ->whereIn('uk.id_mahasiswa', $ids)
            ->whereNull('uk.deleted_at')
            ->groupBy('uk.id_bank_soal_konversi', 'bsk.id_soal')
            ->get();

        $sumTableDrag = 0;
        foreach ($soalRows as $row) {
            $dragCount = DB::table('log_ujian_kode')
                ->whereIn('id_mahasiswa', $ids)
                ->where(function($q) use ($row) {
                    if (!empty($row->id_bank_soal_konversi)) $q->where('id_bank_soal_konversi', $row->id_bank_soal_konversi);
                    if (!empty($row->id_soal)) $q->orWhere('id_soal', $row->id_soal);
                })
                ->whereNull('deleted_at')
                ->count();
            $sumTableDrag += $dragCount;
        }

        $this->assertEquals(
            $totalDragCard,
            $sumTableDrag,
            'Total Drag & Drop pada Kartu Summary HARUS sama 1:1 dengan penjumlahan kolom Drag and Drop pada tabel.'
        );
    }
}
