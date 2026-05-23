<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class BankSoalKonversiSeeder extends Seeder
{
    public function run(): void
    {
        $data = [
            // ============================================================
            // BAGIAN 1: QUEUE (EASY)
            // ============================================================

            // Easy 1: enqueue + print
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Operasi Enqueue dan Print pada Antrian' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(15);\n" .
                                "        q.enqueue(30);\n" .
                                "        q.print();\n" .
                                "    }\n" .
                                "}",
                'output'     => "15 30 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'easy',
            ],

            // Easy 2: enqueue + dequeue + print
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Operasi Dequeue dan Print pada Antrian' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(10); q.enqueue(20); q.enqueue(30);\n" .
                                "        q.dequeue();\n" .
                                "        q.print();\n" .
                                "    }\n" .
                                "}",
                'output'     => "20 30 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'easy',
            ],

            // Easy 3: enqueue + print (variasi data berbeda)
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Antrian Barang Gudang (Enqueue & Print)' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(100); q.enqueue(200); q.enqueue(300);\n" .
                                "        q.print();\n" .
                                "    }\n" .
                                "}",
                'output'     => "100 200 300 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'easy',
            ],

            // Easy 4: enqueue + dequeue + print (2x dequeue)
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Pengurangan Antrian Loket (Dequeue & Print)' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(1); q.enqueue(2); q.enqueue(3); q.enqueue(4);\n" .
                                "        q.dequeue(); q.dequeue();\n" .
                                "        q.print();\n" .
                                "    }\n" .
                                "}",
                'output'     => "3 4 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'easy',
            ],

            // Easy 5: enqueue + print (2 kali)
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Pencatatan Cepat Antrian (Enqueue & Print)' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(88); q.print();\n" .
                                "        q.enqueue(99); q.print();\n" .
                                "    }\n" .
                                "}",
                'output'     => "88 \n88 99 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'easy',
            ],

            // ============================================================
            // BAGIAN 2: QUEUE (MEDIUM)
            // ============================================================

            // Medium 1: Scanner + IsFull + enqueue + peek
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Cek Kapasitas dan Peek Antrian Layanan' LIMIT 1)"),
                'jawaban'    => "import java.util.Scanner;\n" .
                                "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsFull() {\n" .
                                "        if (size == max) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void peek() {\n" .
                                "        if (!IsEmpty()) {\n" .
                                "            System.out.println(\"Elemen terdepan: \" + data[front]);\n" .
                                "        } else {\n" .
                                "            System.out.println(\"Queue masih kosong\");\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Scanner sc = new Scanner(System.in);\n" .
                                "        int n = sc.nextInt();\n" .
                                "        Main q = new Main(n);\n" .
                                "        System.out.println(\"Penuh: \" + q.IsFull());\n" .
                                "        q.enqueue(101);\n" .
                                "        q.peek();\n" .
                                "        sc.close();\n" .
                                "    }\n" .
                                "}",
                'output'     => "Penuh: false\nElemen terdepan: 101",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'medium',
            ],

            // Medium 2: IsEmpty + enqueue + dequeue + clear
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Mengosongkan Sisa Antrian' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void clear() {\n" .
                                "        front = rear = -1;\n" .
                                "        size = 0;\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(55); q.enqueue(66);\n" .
                                "        q.dequeue();\n" .
                                "        q.clear();\n" .
                                "        System.out.println(\"Kosong: \" + q.IsEmpty());\n" .
                                "    }\n" .
                                "}",
                'output'     => "Kosong: true",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'medium',
            ],

            // Medium 3: Scanner + enqueue + dequeue + print
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Simulasi Operasi Layanan Queue' LIMIT 1)"),
                'jawaban'    => "import java.util.Scanner;\n" .
                                "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Scanner sc = new Scanner(System.in);\n" .
                                "        Main q = new Main(10);\n" .
                                "        for (int i = 0; i < 3; i++) q.enqueue(sc.nextInt());\n" .
                                "        q.print();\n" .
                                "        q.dequeue();\n" .
                                "        q.print();\n" .
                                "        sc.close();\n" .
                                "    }\n" .
                                "}",
                'output'     => "5 15 25 \n15 25 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'medium',
            ],

            // Medium 4: Scanner + IsFull + enqueue + peek
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Batas Kapasitas Antrian' LIMIT 1)"),
                'jawaban'    => "import java.util.Scanner;\n" .
                                "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsFull() {\n" .
                                "        if (size == max) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void peek() {\n" .
                                "        if (!IsEmpty()) {\n" .
                                "            System.out.println(\"Elemen terdepan: \" + data[front]);\n" .
                                "        } else {\n" .
                                "            System.out.println(\"Queue masih kosong\");\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Scanner sc = new Scanner(System.in);\n" .
                                "        int n = sc.nextInt();\n" .
                                "        Main q = new Main(n);\n" .
                                "        q.enqueue(10); q.enqueue(20); q.enqueue(30);\n" .
                                "        System.out.println(\"Penuh: \" + q.IsFull());\n" .
                                "        q.peek();\n" .
                                "        sc.close();\n" .
                                "    }\n" .
                                "}",
                'output'     => "Penuh: true\nElemen terdepan: 10",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'medium',
            ],

            // Medium 5: IsEmpty + enqueue + clear + print
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Reset Ulang Antrian Pelanggan' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void clear() {\n" .
                                "        front = rear = -1;\n" .
                                "        size = 0;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(5); q.enqueue(6); q.enqueue(7);\n" .
                                "        q.print();\n" .
                                "        q.clear();\n" .
                                "        System.out.println(\"Kosong: \" + q.IsEmpty());\n" .
                                "    }\n" .
                                "}",
                'output'     => "5 6 7 \nKosong: true",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'medium',
            ],

            // ============================================================
            // BAGIAN 3: QUEUE (HARD)
            // mirip konsep soal PDF pretest-posttest (8,10,12,16,23,24,26,28)
            // ============================================================

            // Hard 1 (mirip soal 12 PDF): Scanner + IsFull + enqueue + loop
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Batas Kapasitas Antrean Wahana Bermain' LIMIT 1)"),
                'jawaban'    => "import java.util.Scanner;\n" .
                                "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsFull() {\n" .
                                "        if (size == max) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Scanner sc = new Scanner(System.in);\n" .
                                "        int n = sc.nextInt();\n" .
                                "        Main q = new Main(n);\n" .
                                "        int[] anak = {11, 22, 33, 44, 55};\n" .
                                "        for (int a : anak) {\n" .
                                "            if (q.IsFull()) { System.out.println(\"Penuh\"); break; }\n" .
                                "            q.enqueue(a);\n" .
                                "        }\n" .
                                "        System.out.println(\"Size: \" + q.size);\n" .
                                "        sc.close();\n" .
                                "    }\n" .
                                "}",
                'output'     => "Penuh\nSize: 3",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'hard',
            ],

            // Hard 2 (mirip soal 16 PDF): enqueue + dequeue + reset front/rear
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Simulasi Reset Antrean Otomatis di Klinik' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        if (front > rear) { front = -1; rear = -1; }\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(101); q.enqueue(102); q.enqueue(103);\n" .
                                "        q.dequeue(); q.dequeue(); q.dequeue();\n" .
                                "        System.out.println(\"Front: \" + q.front);\n" .
                                "        System.out.println(\"Rear: \" + q.rear);\n" .
                                "    }\n" .
                                "}",
                'output'     => "Front: -1\nRear: -1",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'hard',
            ],

            // Hard 3 (mirip soal 24 PDF): Scanner + enqueue + dequeue + push ke Stack
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Pengarsipan Digital Antrean ke Stack' LIMIT 1)"),
                'jawaban'    => "import java.util.Scanner;\n" .
                                "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "    int[] st = new int[10];\n" .
                                "    int top = -1;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void push(int dt) { st[++top] = dt; }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Scanner sc = new Scanner(System.in);\n" .
                                "        Main q = new Main(10);\n" .
                                "        for (int i = 0; i < 3; i++) q.enqueue(sc.nextInt());\n" .
                                "        while (!q.IsEmpty()) q.push(q.dequeue());\n" .
                                "        System.out.println(\"Top arsip: \" + q.st[q.top]);\n" .
                                "        sc.close();\n" .
                                "    }\n" .
                                "}",
                'output'     => "Top arsip: 3",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'hard',
            ],

            // Hard 4 (mirip soal 26 PDF): enqueue + dequeue + push + pop + print (balik urutan)
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Pembalikan Urutan Mobil Keluar Gang' LIMIT 1)"),
                'jawaban'    => "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "    int[] st = new int[10];\n" .
                                "    int top = -1;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void push(int dt) { st[++top] = dt; }\n" .
                                "    public int pop() { return st[top--]; }\n" .
                                "\n" .
                                "    public void print() {\n" .
                                "        for (int i = front; i <= rear; i++) System.out.print(data[i] + \" \");\n" .
                                "        System.out.println();\n" .
                                "    }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Main q = new Main(10);\n" .
                                "        q.enqueue(1); q.enqueue(2); q.enqueue(3);\n" .
                                "        while (!q.IsEmpty()) q.push(q.dequeue());\n" .
                                "        q.front = q.rear = -1; q.size = 0;\n" .
                                "        while (q.top >= 0) q.enqueue(q.pop());\n" .
                                "        q.print();\n" .
                                "    }\n" .
                                "}",
                'output'     => "3 2 1 ",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'hard',
            ],

            // Hard 5 (mirip soal 28 PDF): Scanner + enqueue + push + dequeue + pop + cek palindrom
            [
                'id'         => DB::raw('UUID()'),
                'id_level'   => '019863c4-59f9-7319-9104-08267fc3c551',
                'id_soal'    => DB::raw("(SELECT id FROM soal WHERE judul = 'Validasi Antrean Palindrom' LIMIT 1)"),
                'jawaban'    => "import java.util.Scanner;\n" .
                                "public class Main {\n" .
                                "    int[] data;\n" .
                                "    int front;\n" .
                                "    int rear;\n" .
                                "    int size;\n" .
                                "    int max;\n" .
                                "    int[] st = new int[10];\n" .
                                "    int top = -1;\n" .
                                "\n" .
                                "    public Main(int n) {\n" .
                                "        max = n;\n" .
                                "        data = new int[max];\n" .
                                "        size = 0;\n" .
                                "        front = rear = -1;\n" .
                                "    }\n" .
                                "\n" .
                                "    public boolean IsEmpty() {\n" .
                                "        if (size == 0) {\n" .
                                "            return true;\n" .
                                "        } else {\n" .
                                "            return false;\n" .
                                "        }\n" .
                                "    }\n" .
                                "\n" .
                                "    public void enqueue(int dt) {\n" .
                                "        if (IsEmpty()) { front = rear = 0; } else { rear++; }\n" .
                                "        data[rear] = dt;\n" .
                                "        size++;\n" .
                                "    }\n" .
                                "\n" .
                                "    public int dequeue() {\n" .
                                "        int dt = data[front];\n" .
                                "        front++;\n" .
                                "        size--;\n" .
                                "        return dt;\n" .
                                "    }\n" .
                                "\n" .
                                "    public void push(int dt) { st[++top] = dt; }\n" .
                                "    public int pop() { return st[top--]; }\n" .
                                "\n" .
                                "    public static void main(String[] args) {\n" .
                                "        Scanner sc = new Scanner(System.in);\n" .
                                "        Main q = new Main(10);\n" .
                                "        for (int i = 0; i < 3; i++) {\n" .
                                "            int dt = sc.nextInt();\n" .
                                "            q.enqueue(dt);\n" .
                                "            q.push(dt);\n" .
                                "        }\n" .
                                "        boolean isPalin = true;\n" .
                                "        while (!q.IsEmpty()) {\n" .
                                "            if (q.dequeue() != q.pop()) isPalin = false;\n" .
                                "        }\n" .
                                "        System.out.println(\"Palindrom: \" + isPalin);\n" .
                                "        sc.close();\n" .
                                "    }\n" .
                                "}",
                'output'     => "Palindrom: true",
                'created_at' => now(), 'updated_at' => now(), 'deleted_at' => null, 'difficulty' => 'hard',
            ],
        ];

        DB::table('bank_soal_konversi')->insert($data);
    }
}
