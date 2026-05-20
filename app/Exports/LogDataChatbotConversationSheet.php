<?php

namespace App\Exports;

use Maatwebsite\Excel\Concerns\FromCollection;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\WithStyles;
use Maatwebsite\Excel\Concerns\WithColumnWidths;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use PhpOffice\PhpSpreadsheet\Style\Fill;
use PhpOffice\PhpSpreadsheet\Style\Alignment;
use PhpOffice\PhpSpreadsheet\Style\Border;

class LogDataChatbotConversationSheet implements
    FromCollection,
    WithHeadings,
    WithTitle,
    WithStyles,
    WithColumnWidths
{
    protected $mahasiswas;
    protected $allHistory;

    public function __construct($mahasiswas, array $allHistory)
    {
        $this->mahasiswas = $mahasiswas;
        $this->allHistory = $allHistory;
    }

    public function title(): string
    {
        return 'Percakapan';
    }

    public function headings(): array
    {
        return [
            'No', 'NIM', 'Nama', 'Kelas',
            'No. Sesi', 'Level', 'Soal', 'Waktu Akses', 'Durasi',
            'No. Pesan', 'Pengirim', 'Waktu Pesan', 'Isi Pesan',
        ];
    }

    public function collection()
    {
        $rows = collect();
        $no   = 1;

        foreach ($this->mahasiswas as $mahasiswa) {
            $sessions = $this->allHistory[$mahasiswa->id] ?? [];

            if (empty($sessions)) {
                $rows->push([
                    'no'          => $no++,
                    'nim'         => $mahasiswa->nim,
                    'nama'        => $mahasiswa->name,
                    'kelas'       => $mahasiswa->kelas_name ?: '-',
                    'no_sesi'     => '-',
                    'level'       => '-',
                    'soal'        => '-',
                    'waktu_akses' => '-',
                    'durasi'      => '-',
                    'no_pesan'    => '-',
                    'pengirim'    => '-',
                    'waktu_pesan' => '-',
                    'isi_pesan'   => '-',
                ]);
                continue;
            }

            foreach ($sessions as $session) {
                if (empty($session['conversation'])) {
                    $rows->push([
                        'no'          => $no++,
                        'nim'         => $mahasiswa->nim,
                        'nama'        => $mahasiswa->name,
                        'kelas'       => $mahasiswa->kelas_name ?: '-',
                        'no_sesi'     => $session['no_sesi'],
                        'level'       => $session['level_name'],
                        'soal'        => $session['soal'],
                        'waktu_akses' => $session['waktu_akses'],
                        'durasi'      => $session['durasi'],
                        'no_pesan'    => '-',
                        'pengirim'    => '-',
                        'waktu_pesan' => '-',
                        'isi_pesan'   => '(Tidak ada pesan)',
                    ]);
                    continue;
                }

                foreach ($session['conversation'] as $msg) {
                    $rows->push([
                        'no'          => $no++,
                        'nim'         => $mahasiswa->nim,
                        'nama'        => $mahasiswa->name,
                        'kelas'       => $mahasiswa->kelas_name ?: '-',
                        'no_sesi'     => $session['no_sesi'],
                        'level'       => $session['level_name'],
                        'soal'        => $session['soal'],
                        'waktu_akses' => $session['waktu_akses'],
                        'durasi'      => $session['durasi'],
                        'no_pesan'    => $msg['no_pesan'],
                        'pengirim'    => $msg['pengirim'],
                        'waktu_pesan' => $msg['waktu'],
                        'isi_pesan'   => $msg['pesan'],
                    ]);
                }
            }
        }

        return $rows;
    }

    public function columnWidths(): array
    {
        return [
            'A' => 6,
            'B' => 20,
            'C' => 30,
            'D' => 12,
            'E' => 10,
            'F' => 15,
            'G' => 30,
            'H' => 28,
            'I' => 20,
            'J' => 10,
            'K' => 12,
            'L' => 28,
            'M' => 55,
        ];
    }

    public function styles(Worksheet $sheet): array
    {
        $lastRow = $sheet->getHighestRow();

        // Header
        $sheet->getStyle("A1:M1")->applyFromArray([
            'font' => [
                'bold'  => true,
                'color' => ['argb' => 'FFFFFFFF'],
                'size'  => 11,
            ],
            'fill' => [
                'fillType'   => Fill::FILL_SOLID,
                'startColor' => ['argb' => 'FF366CAD'],
            ],
            'alignment' => [
                'horizontal' => Alignment::HORIZONTAL_CENTER,
                'vertical'   => Alignment::VERTICAL_CENTER,
                'wrapText'   => true,
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                    'color'       => ['argb' => 'FFB8D9FF'],
                ],
            ],
        ]);

        if ($lastRow > 1) {
            $sheet->getStyle("A2:M{$lastRow}")->applyFromArray([
                'alignment' => [
                    'vertical' => Alignment::VERTICAL_CENTER,
                    'wrapText' => true,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => Border::BORDER_THIN,
                        'color'       => ['argb' => 'FFD1D5DB'],
                    ],
                ],
            ]);

            // Center columns
            foreach (['A', 'D', 'E', 'H', 'I', 'J', 'K', 'L'] as $col) {
                $sheet->getStyle("{$col}2:{$col}{$lastRow}")
                    ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            }

            // Warna khusus per pengirim (kolom K = Pengirim)
            for ($i = 2; $i <= $lastRow; $i++) {
                $pengirim = $sheet->getCell("K{$i}")->getValue();

                if ($pengirim === 'Siswa') {
                    $sheet->getStyle("K{$i}")->applyFromArray([
                        'font' => ['color' => ['argb' => 'FF1D4ED8'], 'bold' => true],
                        'fill' => [
                            'fillType'   => Fill::FILL_SOLID,
                            'startColor' => ['argb' => 'FFDBEAFE'],
                        ],
                    ]);
                    // Highlight baris pesan siswa
                    $sheet->getStyle("M{$i}")->applyFromArray([
                        'fill' => [
                            'fillType'   => Fill::FILL_SOLID,
                            'startColor' => ['argb' => 'FFEFF6FF'],
                        ],
                    ]);
                } elseif ($pengirim === 'Chatbot') {
                    $sheet->getStyle("K{$i}")->applyFromArray([
                        'font' => ['color' => ['argb' => 'FF065F46'], 'bold' => true],
                        'fill' => [
                            'fillType'   => Fill::FILL_SOLID,
                            'startColor' => ['argb' => 'FFD1FAE5'],
                        ],
                    ]);
                    // Highlight baris pesan chatbot
                    $sheet->getStyle("M{$i}")->applyFromArray([
                        'fill' => [
                            'fillType'   => Fill::FILL_SOLID,
                            'startColor' => ['argb' => 'FFF0FDF4'],
                        ],
                    ]);
                }
            }
        }

        $sheet->getRowDimension(1)->setRowHeight(22);

        return [];
    }
}