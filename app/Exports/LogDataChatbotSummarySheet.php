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

class LogDataChatbotSummarySheet implements
    FromCollection,
    WithHeadings,
    WithTitle,
    WithStyles,
    WithColumnWidths
{
    protected $mahasiswas;
    protected $countBiasa;

    public function __construct($mahasiswas, $countBiasa)
    {
        $this->mahasiswas = $mahasiswas;
        $this->countBiasa = $countBiasa;
    }

    public function title(): string
    {
        return 'Ringkasan';
    }

    public function headings(): array
    {
        return ['No', 'NIM', 'Nama', 'Kelas', 'Total Akses Chatbot'];
    }

    public function collection()
    {
        return $this->mahasiswas->values()->map(function ($row, $index) {
            return [
                'no'             => $index + 1,
                'nim'            => $row->nim,
                'nama'           => $row->name,
                'kelas'          => $row->kelas_name ?: '-',
                'jumlah_chatbot' => (int) ($this->countBiasa[$row->id] ?? 0),
            ];
        });
    }

    public function columnWidths(): array
    {
        return [
            'A' => 6,
            'B' => 20,
            'C' => 35,
            'D' => 15,
            'E' => 22,
        ];
    }

    public function styles(Worksheet $sheet): array
    {
        $lastRow = $this->mahasiswas->count() + 1;

        // Header style
        $sheet->getStyle('A1:E1')->applyFromArray([
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
            ],
            'borders' => [
                'allBorders' => [
                    'borderStyle' => Border::BORDER_THIN,
                    'color'       => ['argb' => 'FFB8D9FF'],
                ],
            ],
        ]);

        // Data rows
        if ($lastRow > 1) {
            $sheet->getStyle("A2:E{$lastRow}")->applyFromArray([
                'alignment' => [
                    'vertical' => Alignment::VERTICAL_CENTER,
                ],
                'borders' => [
                    'allBorders' => [
                        'borderStyle' => Border::BORDER_THIN,
                        'color'       => ['argb' => 'FFD1D5DB'],
                    ],
                ],
            ]);

            // Center kolom No, Kelas, Total
            $sheet->getStyle("A2:A{$lastRow}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            $sheet->getStyle("D2:D{$lastRow}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);
            $sheet->getStyle("E2:E{$lastRow}")->getAlignment()->setHorizontal(Alignment::HORIZONTAL_CENTER);

            // Striped rows
            for ($i = 2; $i <= $lastRow; $i++) {
                if ($i % 2 === 0) {
                    $sheet->getStyle("A{$i}:E{$i}")->getFill()
                        ->setFillType(Fill::FILL_SOLID)
                        ->getStartColor()->setARGB('FFF0F7FF');
                }
            }
        }

        $sheet->getRowDimension(1)->setRowHeight(22);

        return [];
    }
}