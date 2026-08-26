<?php

namespace App\Exports;

use Illuminate\Support\Facades\DB;
use App\Models\UjianKode;
use App\Models\LogUjianKode;
use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithMapping;

class LogUjianKodeExport implements FromCollection, WithHeadings, WithMapping
{
    protected $idMahasiswa;
    protected $idLevel;
    protected $idSoal;
    protected $ujianKodeModel;
    protected $logUjianKodeModel;

    public function __construct($idMahasiswa, $idLevel, $idSoal)
    {
        $this->idMahasiswa = $idMahasiswa;
        $this->idLevel = $idLevel;
        $this->idSoal = $idSoal;
        $this->ujianKodeModel = new UjianKode();
        $this->logUjianKodeModel = new LogUjianKode();
    }

    public function collection()
    {
        $mUser = DB::table('mahasiswa')->where('id_user', $this->idMahasiswa)->orWhere('id', $this->idMahasiswa)->first();
        $ids = $mUser ? array_filter([$mUser->id, $mUser->id_user]) : [$this->idMahasiswa];

        $query = DB::table('ujian_kode as uk')
            ->leftJoin('bank_soal_konversi as bsk', 'uk.id_bank_soal_konversi', '=', 'bsk.id')
            ->leftJoin('soal as s', 'bsk.id_soal', '=', 's.id')
            ->select(
                'uk.id_bank_soal_konversi',
                'bsk.id_soal',
                'uk.id_level',
                's.judul as judul_soal',
                DB::raw('COUNT(uk.id) as total_submit'),
                DB::raw('MAX(uk.created_at) as created_at'),
                DB::raw('MAX(uk.waktu) as waktu'),
                DB::raw('MAX(uk.nilai) as nilai')
            )
            ->whereIn('uk.id_mahasiswa', $ids)
            ->whereNull('uk.deleted_at');

        if (!empty($this->idLevel)) {
            $query->where('uk.id_level', $this->idLevel);
        }
        if (!empty($this->idSoal)) {
            $query->where('bsk.id_soal', $this->idSoal);
        }

        $data = $query->groupBy('uk.id_bank_soal_konversi', 'bsk.id_soal', 'uk.id_level', 's.judul')
            ->orderBy('created_at', 'desc')
            ->get();

        return $data->map(function ($row) use ($ids) {
            if (empty($row->judul_soal)) {
                $row->judul_soal = $this->resolveSoalJudul(
                    $row->id_soal ?? null,
                    $row->id_bank_soal_konversi ?? null
                ) ?? '-';
            }

            $row->drag_drop = DB::table('log_ujian_kode')
                ->whereIn('id_mahasiswa', $ids)
                ->where(function($q) use ($row) {
                    if (!empty($row->id_bank_soal_konversi)) {
                        $q->where('id_bank_soal_konversi', $row->id_bank_soal_konversi);
                    }
                    if (!empty($row->id_soal)) {
                        $q->orWhere('id_soal', $row->id_soal);
                    }
                })
                ->whereNull('deleted_at')
                ->count();

            $row->total_submit = DB::table('v_ujian_kode')
                ->whereIn('id_mahasiswa', $ids)
                ->where(function($q) use ($row) {
                    if (!empty($row->id_bank_soal_konversi)) {
                        $q->where('id_bank_soal_konversi', $row->id_bank_soal_konversi);
                    }
                    if (!empty($row->id_soal)) {
                        $q->orWhere('id_soal', $row->id_soal);
                    }
                })
                ->whereNull('deleted_at')
                ->count();

            return $row;
        });
    }

    public function headings(): array
    {
        return [
            'No',
            'Soal',
            'Tanggal Ujian',
            'Drag & Drop',
            'Total Submit',
            'Waktu (detik)',
        ];
    }

    public function map($row): array
    {
        static $no = 0;
        $no++;

        return [
            $no,
            $row->judul_soal,   
            $row->created_at,
            $row->drag_drop,
            $row->total_submit,
            $row->waktu,
        ];
    }

    protected function resolveSoalJudul(?string $idSoal, ?string $idBankSoalKonversi): ?string
    {
        if (!empty($idSoal)) {
            $judul = DB::table('soal')
                ->where('id', $idSoal)
                ->value('judul');

            if (!empty($judul)) {
                return $judul;
            }
        }

        if (!empty($idBankSoalKonversi)) {
            $judul = DB::table('bank_soal_konversi as bsk')
                ->join('soal as s', 'bsk.id_soal', '=', 's.id')
                ->where('bsk.id', $idBankSoalKonversi)
                ->value('s.judul');

            if (!empty($judul)) {
                return $judul;
            }
        }

        return null;
    }
}
