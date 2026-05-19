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
        $query = DB::table('ujian_kode as uk')
            ->leftJoin('bank_soal_konversi as bsk', 'uk.id_bank_soal_konversi', '=', 'bsk.id')
            ->leftJoin('soal as s', 'bsk.id_soal', '=', 's.id')
            ->select(
                'uk.id',
                'uk.id_level',
                'uk.id_bank_soal_konversi',
                'bsk.id_soal',
                'uk.id_mahasiswa',
                's.judul as judul_soal',
                'uk.jawaban',
                'uk.output',
                'uk.nilai',
                'uk.waktu',
                'uk.created_at',
                'uk.updated_at',
                'uk.deleted_at'
            )
            ->where('uk.id_mahasiswa', $this->idMahasiswa)
            ->whereNull('uk.deleted_at');

        if (!empty($this->idLevel)) {
            $query->where('uk.id_level', $this->idLevel);
        }
        if (!empty($this->idSoal)) {
            $query->where('bsk.id_soal', $this->idSoal);
        }

        $data = $query->orderBy('uk.created_at', 'desc')->get();

        return $data->map(function ($row) {
            if (empty($row->judul_soal)) {
                $row->judul_soal = $this->resolveSoalJudul(
                    $row->id_soal ?? null,
                    $row->id_bank_soal_konversi ?? null
                ) ?? '-';
            }

            $row->drag_drop = DB::table('log_ujian_kode')
                ->where('id_mahasiswa', $this->idMahasiswa)
                ->where('id_bank_soal_konversi', $row->id_bank_soal_konversi)
                ->whereNull('deleted_at')
                ->count();

            $row->total_submit = DB::table('ujian_kode')
                ->where('id_mahasiswa', $this->idMahasiswa)
                ->where('id_bank_soal_konversi', $row->id_bank_soal_konversi)
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
