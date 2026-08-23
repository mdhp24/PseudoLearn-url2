<?php

namespace App\Repositories;

use App\Models\BankSoalKonversi;
use App\Core\BaseResponse;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\DB;
use Symfony\Component\Process\Process;

class BankSoalKonversiRepository
{
    protected $model;

    public function __construct()
    {
        $this->model = new BankSoalKonversi();
    }

    public function table($request)
{
    $query = $this->model
        ->select(
            'bank_soal_konversi.id',
            'level.name as level_name',
            'soal.judul as soal',
            'bank_soal_konversi.jawaban',
            'bank_soal_konversi.output'
        )
        ->leftJoin('level', 'level.id', '=', 'bank_soal_konversi.id_level')
        ->leftJoin('soal', 'soal.id', '=', 'bank_soal_konversi.id_soal');

    // Filter Level
    $level = $request->input('level');
    if (!is_null($level) && $level !== '') {
        $query->where('bank_soal_konversi.id_level', $level);
    }

    // Order
    $query->orderBy('bank_soal_konversi.created_at', 'asc');

    $dataTable = DataTables::of($query)
        ->addIndexColumn()
        ->filterColumn('level_name', function ($query, $keyword) {
            $query->where('level.name', 'like', "%{$keyword}%");
        })

        ->filterColumn('soal', function ($query, $keyword) {
            $query->where('soal.judul', 'like', "%{$keyword}%");
        })

        ->editColumn('jawaban', function ($item) {
            return $this->formatJawabanHtml($item->jawaban);
        })

        ->editColumn('output', function ($item) {
            return $item->output ?? '-';
        })

        ->rawColumns(['jawaban']);

    // Defensive guard: jika request order column tidak ada atau null,
    // nonaktifkan ordering default Yajra untuk mencegah TypeError
    // (Yajra\DataTables\QueryDataTable::hasOrderColumn() expects string, null given)
    $orderColumn = $request->input('columns.' . $request->input('order.0.column', '') . '.name');
    if (is_null($orderColumn) || $orderColumn === '') {
        $dataTable->ordering(false);
    }

    return $dataTable->make(true);
}

    protected function formatJawabanHtml($jawaban): string
    {
        $lines = $this->normalizeJawabanLines($jawaban);

        if (empty($lines)) {
            return '-';
        }

        $formatted = collect($lines)
            ->map(function ($line, $index) {
                $lineNumber = str_pad((string) ($index + 1), 2, '0', STR_PAD_LEFT);

                return $lineNumber . '. ' . $line;
            })
            ->implode("\n");

        return '<pre class="bank-soal-jawaban-code mb-0">' . e($formatted) . '</pre>';
    }

    protected function normalizeJawabanLines($jawaban): array
    {
        if (is_array($jawaban)) {
            $rawLines = $jawaban;
        } else {
            $text = (string) $jawaban;

            if (trim($text) === '') {
                return [];
            }

            $decoded = json_decode(trim($text), true);
            if (json_last_error() === JSON_ERROR_NONE && is_array($decoded)) {
                $rawLines = $decoded;
            } else {
                $normalized = str_replace(["\r\n", "\r"], "\n", $text);
                $rawLines = explode("\n", $normalized);
            }
        }

        return collect($rawLines)
            ->map(function ($line) {
                if (is_array($line) || is_object($line)) {
                    // Format baru: {"kode": "...", "clue": 0|1}
                    if (is_array($line) && isset($line['kode'])) {
                        return rtrim((string) $line['kode']);
                    }
                    $line = json_encode($line, JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
                }

                return rtrim((string) $line);
            })
            ->filter(fn($line) => trim($line) !== '')
            ->values()
            ->all();
    }

    public function getOrderListByLevel(string $levelId)
    {
        return DB::table('bank_soal_konversi')
            ->leftJoin('soal', 'soal.id', '=', 'bank_soal_konversi.id_soal')
            ->where('bank_soal_konversi.id_level', $levelId)
            ->orderBy('bank_soal_konversi.created_at', 'asc')
            ->select(
                'bank_soal_konversi.id',
                'bank_soal_konversi.id_soal',
                'soal.judul as judul'
            )
            ->get();
    }

    public function saveOrder(array $orders): bool
    {
        // Method ini tidak relevan lagi karena kolom 'order' dihapus.
        return false;
    }

    public function getSoalByLevel($levelId)
    {
        return DB::table('soal')
            ->where('id_level', $levelId)
            ->select('id', 'judul')
            ->orderBy('judul')
            ->get();
    }

    public function store($payload)
    {
        return $this->model->create($payload);
    }

    public function update($payload, $id)
    {
        $data = $this->model->find($id, ['*']);
        if (!$data) return false;
        return $data->update($payload);
    }

    public function destroy($id)
    {
        $record = $this->model->find($id, ['*']);
        if (!$record) return false;
        return $record->delete();
    }

    public function detail($id)
    {
        return $this->model->find($id, ['*']);
    }

    /**
     * Table for ujian konversi (v_ujian_konversi or ujian_konversi view)
     * Provides a DataTables response similar to other table methods.
     */
    public function tableUjianKonversi($request)
    {
        $query = DB::table('v_ujian_konversi')
            ->select('*');

        // optional filter by level
        $level = $request->input('level');
        if (!is_null($level) && $level !== '') {
            $query->where('id_level', $level);
        }

        $query->orderBy('created_at', 'desc');

        return DataTables::of($query)
            ->addIndexColumn()
            ->make(true);
    }

    public function runJavaCode($request)
    {
        try {
            $codes      = $request->input('codes', []);
            $soalId     = $request->input('soal_id');
            $soalInput  = $request->input('scanner_input', '');

            $safeSoalId = str_replace('-', '_', $soalId);
            $className   = 'Main_' . $safeSoalId;

            // Gabungkan semua baris kode
            $rawJoined = collect($codes)
                ->pluck('value')
                ->filter(fn($line) => $line !== null && trim($line) !== '')
                ->implode("\n");

            // Jika user paste full class (sudah punya public class Main + main method),
            // pertahankan seluruh source dan hanya sesuaikan nama class.
            // NOTE: jangan deteksi class Node / class lain — hanya deteksi class Main
            $mainCode = '';
            $isFullClassSource = preg_match('/\b(?:public\s+)?class\s+Main\b/i', $rawJoined) === 1;

            if ($isFullClassSource) {
                $mainCode = $this->renameJavaClassName($rawJoined, $className);
            } else {
                foreach ($codes as $code) {
                    if (isset($code['value']) && trim($code['value']) !== '') {
                        $mainCode .= '        ' . $code['value'] . "\n";
                    }
                }
            }

            // Auto-cast assignment supaya tipe data konsisten
            $lines    = explode("\n", $mainCode);
            $varTypes = [];

            foreach ($lines as $line) {
                $trim = trim($line);
                if (preg_match('/^(int|float|double|long)\s+([a-zA-Z_][a-zA-Z0-9_]*)/', $trim, $m)) {
                    $varTypes[$m[2]] = $m[1];
                }
            }

            $fixed = [];
            foreach ($lines as $line) {
                $trim = trim($line);
                if (preg_match('/^([a-zA-Z_][a-zA-Z0-9_]*)\s*=\s*(.+);$/', $trim, $m)) {
                    $var  = $m[1];
                    $expr = $m[2];
                    if (isset($varTypes[$var])) {
                        $line = '        ' . $var . ' = (' . $varTypes[$var] . ')(' . $expr . ');';
                    }
                }
                $fixed[] = $line;
            }

            $mainCode = implode("\n", $fixed);

            // Deteksi import yang dibutuhkan secara otomatis
            $imports = [];

            $importMap = [
                'Scanner'           => 'java.util.Scanner',
                'ArrayList'         => 'java.util.ArrayList',
                'LinkedList'        => 'java.util.LinkedList',
                'HashMap'           => 'java.util.HashMap',
                'HashSet'           => 'java.util.HashSet',
                'Arrays'            => 'java.util.Arrays',
                'Collections'       => 'java.util.Collections',
                'List'              => 'java.util.List',
                'Map'               => 'java.util.Map',
                'Set'               => 'java.util.Set',
                'Stack'             => 'java.util.Stack',
                'Queue'             => 'java.util.Queue',
                'Iterator'          => 'java.util.Iterator',
                'Random'            => 'java.util.Random',
                'Math'              => null,
                'BufferedReader'    => 'java.io.BufferedReader',
                'InputStreamReader' => 'java.io.InputStreamReader',
                'IOException'       => 'java.io.IOException',
                'FileReader'        => 'java.io.FileReader',
                'FileWriter'        => 'java.io.FileWriter',
                'PrintWriter'       => 'java.io.PrintWriter',
            ];

            foreach ($importMap as $class => $importPath) {
                if ($importPath && preg_match('/\b' . preg_quote($class, '/') . '\b/', $mainCode)) {
                    $imports[] = 'import ' . $importPath . ';';
                }
            }

            $imports     = array_unique($imports);
            sort($imports);
            $importBlock = !empty($imports) ? implode("\n", $imports) . "\n\n" : '';

            // Rakit file Java final
            if ($isFullClassSource) {
                $javaCode = $importBlock . $mainCode;
            } else {
                $javaCode = $importBlock
                    . 'public class ' . $className . ' {' . "\n"
                    . '    public static void main(String[] args) {' . "\n"
                    . $mainCode
                    . '    }' . "\n"
                    . '}' . "\n";
            }

            // Tulis file .java
            $dirPath = storage_path('app/java/' . $soalId);
            if (!is_dir($dirPath)) {
                mkdir($dirPath, 0777, true);
            }

            $filePath = $dirPath . '/' . $className . '.java';
            file_put_contents($filePath, $javaCode);

            $javaHome = env('JAVA_HOME', '');
            $javaBin  = $javaHome
                ? rtrim($javaHome, '/\\') . DIRECTORY_SEPARATOR . 'bin' . DIRECTORY_SEPARATOR . 'java'
                : 'java';
            $javacBin = $javaHome
                ? rtrim($javaHome, '/\\') . DIRECTORY_SEPARATOR . 'bin' . DIRECTORY_SEPARATOR . 'javac'
                : 'javac';

            if ($isFullClassSource) {
                // Full class source: kompilasi dulu dengan javac, lalu jalankan class
                // secara eksplisit agar tidak salah menjalankan class Node (class pertama dalam file)
                $compileProcess = new Process([$javacBin, basename($filePath)], $dirPath);
                $compileProcess->setTimeout(15);
                $compileProcess->run();

                if (!$compileProcess->isSuccessful()) {
                    throw new \RuntimeException(
                        'Kompilasi gagal:' . "\n" . $compileProcess->getErrorOutput()
                    );
                }

                $runProcess = new Process([$javaBin, '-cp', '.', $className], $dirPath);
                $runProcess->setTimeout(15);
                $runProcess->setInput($soalInput);
                $runProcess->run();

                if (!$runProcess->isSuccessful()) {
                    throw new \RuntimeException(
                        'Eksekusi gagal:' . "\n" . $runProcess->getErrorOutput()
                    );
                }

                $output = $runProcess->getOutput();
            } else {
                // Single method body: jalankan langsung source file (Java 11+)
                $process = new Process([$javaBin, basename($filePath)], $dirPath);
                $process->setTimeout(15);
                $process->setInput($soalInput);
                $process->run();

                if (!$process->isSuccessful()) {
                    throw new \RuntimeException(
                        'Eksekusi gagal:' . "\n" . $process->getErrorOutput()
                    );
                }

                $output = $process->getOutput();
            }

            return BaseResponse::json([
                'status' => true,
                'output' => trim($output),
                'path'   => $filePath,
            ]);
        } catch (\Exception $e) {
            return BaseResponse::errorMessage($e->getMessage(), 500);
        }
    }

    protected function renameJavaClassName(string $javaCode, string $className): string
    {
        // Cari class yang memiliki method main() — itu yang harus di-rename
        // agar file .java bisa dijalankan dengan source-file mode.
        $pattern = '/\b((?:public\s+)?(?:abstract\s+|final\s+)?)class\s+([A-Za-z_][A-Za-z0-9_]*)/i';
        preg_match_all($pattern, $javaCode, $allMatches, PREG_SET_ORDER);

        if (empty($allMatches)) {
            return $javaCode;
        }

        // Jika hanya satu class, rename class tersebut
        if (count($allMatches) === 1) {
            $originalClass = $allMatches[0][2];
            $updatedCode = preg_replace_callback($pattern, function ($m) use ($className) {
                return $m[1] . 'class ' . $className;
            }, $javaCode, 1);

            // Rename juga constructornya
            if ($originalClass !== $className) {
                $updatedCode = $this->renameConstructors($updatedCode, $originalClass, $className);
            }

            return $updatedCode ?? $javaCode;
        }

        // Banyak class: cari class yang berisi main()
        $targetClass = null;
        foreach ($allMatches as $idx => $m) {
            $cName = $m[2];
            $fullMatch = $m[0];
            $pos = strpos($javaCode, $fullMatch);
            if ($pos === false) continue;

            // Cari buka kurung { setelah deklarasi class
            $openBrace = strpos($javaCode, '{', $pos + strlen($fullMatch));
            if ($openBrace === false) continue;

            // Cari tutup kurung } yang matching (sederhana: hitung depth)
            $depth = 0;
            $endPos = $openBrace;
            for ($j = $openBrace; $j < strlen($javaCode); $j++) {
                $ch = $javaCode[$j];
                if ($ch === '{') $depth++;
                elseif ($ch === '}') $depth--;
                if ($depth === 0) { $endPos = $j; break; }
            }

            // Cari main() di dalam body class (antara { dan })
            $body = substr($javaCode, $openBrace + 1, $endPos - $openBrace - 1);
            if (preg_match('/public\s+static\s+void\s+main\s*\(/', $body)) {
                $targetClass = $cName;
                break;
            }
        }

        // Fallback: rename class pertama jika tidak ada yang punya main()
        if ($targetClass === null) {
            $targetClass = $allMatches[0][2];
        }

        // Rename target class
        $found = 0;
        $updatedCode = preg_replace_callback($pattern, function ($m) use ($className, $targetClass, &$found) {
            if ($m[2] === $targetClass && $found === 0) {
                $found++;
                return $m[1] . 'class ' . $className;
            }
            return $m[0]; // leave other classes unchanged
        }, $javaCode);

        // Rename constructors of the renamed class
        if ($targetClass !== $className) {
            $updatedCode = $this->renameConstructors($updatedCode, $targetClass, $className);
        }

        return $updatedCode ?? $javaCode;
    }

    /**
     * Rename constructor declarations dari $oldName ke $newName.
     * Hanya rename yang berupa constructor (bukan constructor call dengan new).
     */
    private function renameConstructors(string $code, string $oldName, string $newName): string
    {
        // Pola: OldName( yang TIDAK didahului "new " → ganti dengan NewName(
        // Gunakan \K untuk discard "new " dari match
        $pattern = '/(?:new\s+)?\b' . preg_quote($oldName, '/') . '\s*\(/';
        return preg_replace_callback($pattern, function ($m) use ($oldName, $newName) {
            // Jika match diawali "new ", itu constructor call — jangan diubah
            if (str_starts_with(trim($m[0]), 'new')) {
                return $m[0];
            }
            // Otherwise itu constructor declaration — ganti namanya
            return $newName . '(';
        }, $code);
    }

    protected function extractMainBody(string $javaCode): array
    {
        $normalized = str_replace("\r\n", "\n", $javaCode);
        $mainPos = stripos($normalized, 'main(');
        if ($mainPos === false) {
            return [];
        }

        $openBracePos = strpos($normalized, '{', $mainPos);
        if ($openBracePos === false) {
            return [];
        }

        $depth = 0;
        $body = '';
        $length = strlen($normalized);
        for ($i = $openBracePos; $i < $length; $i++) {
            $ch = $normalized[$i];
            if ($ch === '{') {
                $depth++;
                if ($depth === 1) {
                    continue;
                }
            } elseif ($ch === '}') {
                $depth--;
                if ($depth === 0) {
                    break;
                }
            }

            if ($depth >= 1) {
                $body .= $ch;
            }
        }

        if (trim($body) === '') {
            return [];
        }

        return array_map(
            fn($line) => trim($line),
            explode("\n", $body)
        );
    }
}
