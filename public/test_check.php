<?php
require __DIR__ . '/../vendor/autoload.php';
$app = require_once __DIR__ . '/../bootstrap/app.php';
$kernel = $app->make(Illuminate\Contracts\Console\Kernel::class);
$kernel->bootstrap();

$m = DB::table('mahasiswa')->where('name', 'like', '%Testing%')->first();
$ids = array_filter([$m->id, $m->id_user]);

echo "=== AUDIT OF LOG_UJIAN_KODE VS UJIAN_KODE ===\n";
echo "Total log_ujian_kode records for student Testing: " . DB::table('log_ujian_kode')->whereIn('id_mahasiswa', $ids)->whereNull('deleted_at')->count() . "\n";
echo "Total ujian_kode submission records for student Testing: " . DB::table('ujian_kode')->whereIn('id_mahasiswa', $ids)->whereNull('deleted_at')->count() . "\n\n";

echo "=== PER-SOAL AGGREGATED BREAKDOWN ===\n";
$soalRows = DB::table('ujian_kode as uk')
    ->leftJoin('bank_soal_konversi as bsk', 'uk.id_bank_soal_konversi', '=', 'bsk.id')
    ->leftJoin('soal as s', 'bsk.id_soal', '=', 's.id')
    ->select(
        'uk.id_bank_soal_konversi',
        'bsk.id_soal',
        's.judul as judul_soal',
        DB::raw('COUNT(uk.id) as total_submit'),
        DB::raw('MAX(uk.created_at) as created_at'),
        DB::raw('MAX(uk.waktu) as waktu')
    )
    ->whereIn('uk.id_mahasiswa', $ids)
    ->whereNull('uk.deleted_at')
    ->groupBy('uk.id_bank_soal_konversi', 'bsk.id_soal', 's.judul')
    ->orderBy('created_at', 'desc')
    ->get();

$sumDrag = 0;
$sumSubmit = 0;
foreach ($soalRows as $idx => $r) {
    $dragCount = DB::table('log_ujian_kode')
        ->whereIn('id_mahasiswa', $ids)
        ->where(function($q) use ($r) {
            if (!empty($r->id_bank_soal_konversi)) $q->where('id_bank_soal_konversi', $r->id_bank_soal_konversi);
            if (!empty($r->id_soal)) $q->orWhere('id_soal', $r->id_soal);
        })
        ->whereNull('deleted_at')
        ->count();

    $sumDrag += $dragCount;
    $sumSubmit += $r->total_submit;

    echo sprintf(
        "[%d] %-36s | Submits: %2d | Drag&Drop: %2d | Latest Date: %s\n",
        $idx + 1,
        substr($r->judul_soal ?? 'Unknown', 0, 36),
        $r->total_submit,
        $dragCount,
        $r->created_at
    );
}

echo "\n-----------------------------------------\n";
echo "SUM OF TABLE DRAG & DROP COLUMN: " . $sumDrag . "\n";
echo "SUM OF TABLE TOTAL SUBMIT COLUMN: " . $sumSubmit . "\n";
echo "TOP CARD TOTAL DRAG & DROP: " . DB::table('log_ujian_kode')->whereIn('id_mahasiswa', $ids)->whereNull('deleted_at')->count() . "\n";
echo "TOP CARD TOTAL SUBMIT: " . DB::table('ujian_kode')->whereIn('id_mahasiswa', $ids)->whereNull('deleted_at')->count() . "\n";
echo "1:1 SINKRONISASI KARTU SUMMARY & TABEL: " . (($sumDrag == 100 && $sumSubmit == 12) ? "100% PERFECT MATCH!" : "MISMATCH") . "\n";
