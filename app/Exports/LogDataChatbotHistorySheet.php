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

class LogDataChatbotHistorySheet implements
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
        return 'Riwayat Akses';
    }

    public function headings(): array
    {
        return [
            'No', 'NIM', 'Nama', 'Kelas',
            'No. Sesi', 'Level', 'Soal',
            'Waktu Akses', 'Durasi', 'Jumlah Pesan',
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
                    'no'           => $no++,
                    'nim'          => $mahasiswa->nim,
                    'nama'         => $mahasiswa->name,
                    'kelas'        => $mahasiswa->kelas_name ?: '-',
                    'no_sesi'      => '-',
                    'level'        => '-',
                    'soal'         => '-',
                    'waktu_akses'  => '-',
                    'durasi'       => '-',
                    'jumlah_pesan' => 0,
                ]);
                continue;
            }

            foreach ($sessions as $session) {
                $rows->push([
                    'no'           => $no++,
                    'nim'          => $mahasiswa->nim,
                    'nama'         => $mahasiswa->name,
                    'kelas'        => $mahasiswa->kelas_name ?: '-',
                    'no_sesi'      => $session['no_sesi'],
                    'level'        => $session['level_name'],
                    'soal'         => $session['soal'],
                    'waktu_akses'  => $session['waktu_akses'],
                    'durasi'       => $session['durasi'],
                    'jumlah_pesan' => count($session['conversation']),
                ]);
            }
        }

        return $rows;
    }

    public function columnWidths(): array
    {
        return [
            'A' => 6,
            'B' => 20,
            'C' => 35,
            'D' => 12,
            'E' => 10,
            'F' => 15,
            'G' => 35,
            'H' => 28,
            'I' => 20,
            'J' => 15,
        ];
    }

    public function styles(Worksheet $sheet): array
    {
        $lastRow = $sheet->getHighestRow();

        // Header
        $sheet->getStyle("A1:J1")->applyFromArray([
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
            $sheet->getStyle("A2:J{$lastRow}")->applyFromArray([
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

            // Center: No, No.Sesi, Jumlah Pesan
            foreach (['A', 'E', 'J'] as $col) {
                $sheet->getStyle("{$col}2:{$col}{$lastRow}")
                    ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            }

            // Center: Kelas, Waktu Akses, Durasi
            foreach (['D', 'H', 'I'] as $col) {
                $sheet->getStyle("{$col}2:{$col}{$lastRow}")
                    ->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            }

            // Striped rows
            for ($i = 2; $i <= $lastRow; $i++) {
                if ($i % 2 === 0) {
                    $sheet->getStyle("A{$i}:J{$i}")->getFill()
                        ->setFillType(Fill::FILL_SOLID)
                        ->getStartColor()->setARGB('FFF0F7FF');
                }
            }
        }

        $sheet->getRowDimension(1)->setRowHeight(22);

        return [];
    }
}