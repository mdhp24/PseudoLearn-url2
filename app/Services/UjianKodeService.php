<?php

namespace App\Services;

use Illuminate\Support\Facades\DB;
use App\Repositories\UjianKodeRepository;

class UjianKodeService
{
    protected $ujianKodeRepository;

    public function __construct()
    {
        $this->ujianKodeRepository = new UjianKodeRepository();
    }

    public function submitKonversi($request)
    {
        return $this->ujianKodeRepository->submitKonversi($request);
    }

    // Admin
    public function tableUjianKode($request)
    {
        try {
            $search = $request->input('search.value', '');
            $kelas  = $request->input('kelas', '');
            $level  = $request->input('level', '');
            $soal   = $request->input('soal', '');

            $query = DB::table('v_mahasiswa as m')
                ->selectRaw('
                m.id_user   as id_mahasiswa,
                m.nim,
                m.name,
                m.id_kelas,
                m.kelas_name
            ')
                ->whereNull('m.deleted_at');

            // Kalau ada filter level/soal, hanya tampilkan mahasiswa
            // yang punya record di v_ujian_kode sesuai filter tsb
            if (!empty($level) || !empty($soal)) {
                $query->whereExists(function ($sub) use ($level, $soal) {
                    $sub->from('v_ujian_kode as u')
                        ->whereColumn('u.id_mahasiswa', 'm.id_user')
                        ->whereNull('u.deleted_at');

                    if (!empty($level)) $sub->where('u.id_level', $level);
                    if (!empty($soal))  $sub->where('u.id_soal', $soal);
                });
            }

            if (!empty($search)) {
                $query->where(function ($q) use ($search) {
                    $q->where('m.name', 'like', "%{$search}%")
                        ->orWhere('m.nim',  'like', "%{$search}%");
                });
            }

            if (!empty($kelas)) {
                $query->where('m.id_kelas', $kelas);
            }

            $total = (clone $query)->count();
            $data  = (clone $query)
                ->orderBy('m.name', 'asc')
                ->offset($request->input('start', 0))
                ->limit($request->input('length', 10))
                ->get();

            return response()->json([
                'draw'            => intval($request->input('draw')),
                'recordsTotal'    => $total,
                'recordsFiltered' => $total,
                'data'            => $data,
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'draw'            => 1,
                'recordsTotal'    => 0,
                'recordsFiltered' => 0,
                'data'            => [],
                'error'           => $e->getMessage()
            ]);
        }
    }
    public function tableDetail($request)
    {
        $idMahasiswa = $request->input('id_mahasiswa');
        $idLevel     = $request->input('id_level', '');
        $idSoal      = $request->input('id_soal', '');
        $start       = $request->input('start', 0);
        $length      = $request->input('length', 10);

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
            ->where(function($q) use ($idMahasiswa) {
                $m = DB::table('mahasiswa')->where('id_user', $idMahasiswa)->orWhere('id', $idMahasiswa)->first();
                $ids = $m ? array_filter([$m->id, $m->id_user]) : [$idMahasiswa];
                $q->whereIn('uk.id_mahasiswa', $ids);
            })
            ->whereNull('uk.deleted_at');

        if (!empty($idLevel)) {
            $query->where('uk.id_level', $idLevel);
        }

        if (!empty($idSoal)) {
            $query->where('bsk.id_soal', $idSoal);
        }

        $total = (clone $query)->count();
        $data  = (clone $query)
            ->orderBy('uk.created_at', 'desc')
            ->offset($start)
            ->limit($length)
            ->get();

        $m = DB::table('mahasiswa')->where('id_user', $idMahasiswa)->orWhere('id', $idMahasiswa)->first();
        $ids = $m ? array_filter([$m->id, $m->id_user]) : [$idMahasiswa];

        // ── Tambah kolom drag_drop & total_submit per baris ──
        $data = $data->map(function ($row) use ($ids) {
            if (empty($row->judul_soal)) {
                $row->judul_soal = $this->resolveSoalJudul(
                    $row->id_soal ?? null,
                    $row->id_bank_soal_konversi ?? null
                ) ?? '-';
            }

            // Total drag & drop untuk soal ini
            $row->drag_drop = DB::table('log_ujian_kode')
                ->whereIn('id_mahasiswa', $ids)
                ->when(!empty($row->id_bank_soal_konversi), fn($q) => $q->where('id_bank_soal_konversi', $row->id_bank_soal_konversi))
                ->whereNull('deleted_at')
                ->count();

            // Total submit untuk soal ini
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

        return response()->json([
            'draw'            => intval($request->input('draw')),
            'recordsTotal'    => $total,
            'recordsFiltered' => $total,
            'data'            => $data,
        ]);
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
