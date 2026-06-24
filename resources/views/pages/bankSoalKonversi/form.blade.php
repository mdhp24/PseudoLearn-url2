@extends('layouts.main')

@push('styles')
    <link rel="stylesheet" href="https://code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css" />
    <style>
        .ck-editor__editable {
            min-height: 120px;
        }

        #jawaban-textarea {
            font-family: monospace;
            font-size: 13px;
            line-height: 1.8;
            resize: vertical;
            min-height: 180px;
        }

        /* ── Panel pseudocode ── */
        #panel-pseudocode {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            overflow: hidden;
        }

        #panel-pseudocode .pseudo-header {
            background: #1a2744;
            color: #fff;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        #panel-pseudocode .pseudo-body {
            padding: 12px 16px;
            background: #f8f9fa;
        }

        .pseudo-legend {
            display: flex;
            gap: 16px;
            font-size: 11px;
            color: #6b7280;
            margin-bottom: 10px;
            padding-bottom: 8px;
            border-bottom: 1px solid #e2e8f0;
        }

        .pseudo-legend span {
            display: flex;
            align-items: center;
            gap: 5px;
        }

        .pseudo-legend .dot {
            width: 10px;
            height: 10px;
            border-radius: 2px;
            flex-shrink: 0;
        }

        .pseudo-step {
            display: flex;
            align-items: stretch;
            gap: 10px;
            margin-bottom: 7px;
        }

        .pseudo-step-num {
            min-width: 28px;
            height: 32px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 600;
            color: #fff;
            background: #1a2744;
            border-radius: 6px;
            flex-shrink: 0;
        }

        .pseudo-step-text {
            flex: 1;
            padding: 6px 12px;
            border-radius: 6px;
            font-size: 12px;
            font-family: monospace;
            display: flex;
            align-items: center;
            justify-content: space-between;
            gap: 8px;
        }

        .pseudo-step-text.tipe-data {
            background: #e8f0fe;
            color: #1a2744;
            border-left: 3px solid #4a6fa5;
        }

        .pseudo-step-text.algoritma {
            background: #e6f4ea;
            color: #14532d;
            border-left: 3px solid #34a853;
        }

        .pseudo-badge {
            font-size: 10px;
            padding: 2px 7px;
            border-radius: 4px;
            white-space: nowrap;
            flex-shrink: 0;
        }

        .pseudo-badge.tipe {
            background: #4a6fa5;
            color: #fff;
        }

        .pseudo-badge.algo {
            background: #34a853;
            color: #fff;
        }

        /*.jawaban-code-preview {
            display: flex;
            flex-wrap: wrap;
            align-items: flex-start;
            gap: 8px;
        }

        .jawaban-code-card {
            background: #1b2640;
            border: 1px solid #2b3858;
            border-radius: 10px;
            padding: 6px 10px;
            box-shadow: 0 1px 2px rgba(15, 23, 42, 0.18);
            display: inline-flex;
            align-items: flex-start;
            gap: 10px;
            max-width: 100%;
        }

        .jawaban-code-line-content {
            flex: 1;
            white-space: pre-wrap;
            word-break: break-word;
            color: #e5e7eb;
            font-family: "JetBrains Mono", "Fira Code", monospace;
            font-size: 12px;
            line-height: 1.6;
        }*/

        #btn-run-konversi.loading {
            pointer-events: none;
            opacity: 0.7;
        }

        /* ── Panel Clue ── */
        #panel-clue {
            border: 1px solid #e2e8f0;
            border-radius: 8px;
            overflow: hidden;
        }

        #panel-clue .clue-header {
            background: #1a2744;
            color: #fff;
            padding: 10px 16px;
            font-size: 13px;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        #panel-clue .clue-body {
            padding: 12px 16px;
            background: #f8f9fa;
        }

        .clue-info-text {
            font-size: 12px;
            color: #6b7280;
            margin-bottom: 10px;
            padding-bottom: 8px;
            border-bottom: 1px solid #e2e8f0;
        }

        .clue-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
            padding: 6px 10px;
            border-radius: 6px;
            background: #fff;
            border: 1px solid #e2e8f0;
            transition: background 0.15s;
        }

        .clue-row:hover {
            background: #f0f4ff;
        }

        .clue-row.is-clue {
            background: #fef9e7;
            border-color: #f59e0b;
        }

        .clue-row-num {
            min-width: 26px;
            height: 26px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 11px;
            font-weight: 600;
            color: #fff;
            background: #1a2744;
            border-radius: 5px;
            flex-shrink: 0;
        }

        .clue-row-code {
            flex: 1;
            font-family: "JetBrains Mono", "Fira Code", monospace;
            font-size: 12px;
            color: #1e293b;
            white-space: pre-wrap;
            word-break: break-word;
        }

        .clue-checkbox-wrap {
            display: flex;
            align-items: center;
            gap: 5px;
            flex-shrink: 0;
            cursor: pointer;
        }

        .clue-checkbox-wrap input[type="checkbox"] {
            width: 16px;
            height: 16px;
            cursor: pointer;
            accent-color: #f59e0b;
        }

        .clue-checkbox-label {
            font-size: 11px;
            color: #6b7280;
            cursor: pointer;
            white-space: nowrap;
        }

        .clue-badge {
            font-size: 10px;
            padding: 2px 7px;
            border-radius: 4px;
            background: #f59e0b;
            color: #fff;
            white-space: nowrap;
            flex-shrink: 0;
        }

        .clue-empty {
            font-size: 12px;
            color: #9ca3af;
            text-align: center;
            padding: 12px 0;
        }
    </style>
@endpush


@section('content')
    <div class="container-fluid px-4" id="form-soal-container">
        <div class="row">
            <div class="col-12">
                <div class="bg-white rounded-4 shadow-sm p-8 mb-5">
                    <div class="d-flex justify-content-between align-items-center mb-8">
                        <h3 class="mb-0">Form Soal</h3>
                    </div>
                    <form method="POST" action="{{ route('bank-soal-konversi.store') }}" id="form-soal">
                        <input type="hidden" name="id" id="id_konversi">
                        <input type="hidden" name="data-soal" id="data-soal" value="{{ $data ? json_encode($data) : '' }}">
                        {{-- Hidden input clue[] akan di-inject oleh JS sebelum submit --}}
                        <div id="clue-hidden-inputs"></div>
                        @csrf

                        {{-- Baris 1: Select Level, Soal --}}
                        <div class="row mb-5">
                            <div class="fv-row col-md-4">
                                <label for="level_id" class="form-label fs-5 required">Level</label>
                                <select name="level_id" id="level_id" class="form-select" data-control="select2"
                                    data-hide-search="true">
                                    <option value="" selected disabled>Pilih Level</option>
                                    @foreach ($levels as $level)
                                        <option value="{{ $level['id'] }}">{{ $level['name'] }}</option>
                                    @endforeach
                                </select>
                            </div>

                            <div class="fv-row col-md-4">
                                <label for="soal_id" class="form-label fs-5 required">Soal</label>
                                <select name="soal_id" id="soal_id" class="form-select" data-control="select2"
                                    data-hide-search="true">
                                    <option value="" selected disabled>Pilih Soal</option>
                                </select>
                            </div>
                        </div>

                        {{-- Soal (readonly CKEditor) --}}
                        <div class="row mb-5">
                            <div class="fv-row col-md-12">
                                <label for="soal" class="form-label fs-5 required">Soal</label>
                                <textarea name="soal" id="soal" class="form-control" rows="3" readonly></textarea>
                            </div>
                        </div>

                        {{-- Panel Pseudocode --}}
                        <div class="row mb-5 d-none" id="row-pseudocode">
                            <div class="fv-row col-md-12">
                                <label class="form-label fs-5">Pseudocode</label>
                                <div id="panel-pseudocode">
                                    <div class="pseudo-header">
                                        <i class="ki-outline ki-code fs-6"></i>
                                        Langkah-langkah pseudocode soal ini
                                    </div>
                                    <div class="pseudo-body">
                                        <div class="pseudo-legend">
                                            <span>
                                                <span class="dot" style="background:#4a6fa5;"></span>
                                                Tipe Data / Variabel
                                            </span>
                                            <span>
                                                <span class="dot" style="background:#34a853;"></span>
                                                Algoritma / Langkah
                                            </span>
                                        </div>
                                        <div id="pseudo-steps"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        {{-- Jawaban Kode Java --}}
                        <div class="row mb-5">
                            <div class="fv-row col-md-12">
                                <label for="jawaban-textarea" class="form-label fs-5 required">
                                    Jawaban (Kode Java)
                                </label>
                                <textarea name="jawaban" id="jawaban-textarea" class="form-control" rows="5"
                                    placeholder="Tulis setiap baris kode Java di baris baru..."></textarea>
                            </div>
                        </div>

                        {{-- Preview chip urut
                        <div class="row mb-5 d-none" id="row-preview-chip">
                            <div class="fv-row col-md-12">
                                <label class="form-label fs-6 text-muted">
                                    Preview struktur kode Java (urut)
                                </label>
                                <div id="preview-chip-wrap" class="jawaban-code-preview"></div>
                            </div>
                        </div> --}}

                        {{-- ══ PANEL CLUE ══ --}}
                        <div class="row mb-5 d-none" id="row-clue">
                            <div class="fv-row col-md-12">
                                <label class="form-label fs-5">
                                    Tandai Clue
                                    <span class="fs-7 text-muted ms-2">(baris yang dijadikan petunjuk untuk mahasiswa)</span>
                                </label>
                                <div id="panel-clue">
                                    <div class="clue-header">
                                        <i class="ki-outline ki-information-5 fs-6"></i>
                                        Pilih baris kode Java yang menjadi clue
                                    </div>
                                    <div class="clue-body">
                                        <div class="clue-info-text">
                                            Centang baris yang ingin ditampilkan sebagai <strong>petunjuk</strong> di quiz
                                            drag-and-drop.
                                        </div>
                                        <div id="clue-list"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        {{-- ══ END PANEL CLUE ══ --}}

                        <div class="d-flex justify-content-between mb-4">
                            <div>
                                <button type="button" class="btn btn-sm btn-primary" id="btn-run-konversi"
                                    onclick="runKonversi()">
                                    <i class="ki-outline ki-send fs-6"></i>
                                    Jalankan Konversi
                                </button>
                            </div>
                        </div>

                        {{-- Input Scanner --}}
                        <div class="row mb-5 d-none" id="row-input-scanner">
                            <div class="fv-row col-md-12">
                                <label class="form-label fs-5">Masukkan Nilai Input</label>
                                <div id="scanner-fields" class="d-flex flex-column gap-3"></div>
                                <button type="button" class="btn btn-sm btn-success mt-3" id="btn-run-scanner"
                                    onclick="runWithScanner()">
                                    <i class="ki-outline ki-play fs-6"></i>
                                    Run
                                </button>
                            </div>
                        </div>

                        {{-- Output --}}
                        <div class="row mb-10">
                            <div class="fv-row col-md-12">
                                <label for="output" class="form-label fs-5 required">Output</label>
                                <textarea name="output" id="output" class="form-control" rows="3" readonly
                                    required></textarea>
                            </div>
                        </div>

                        <div class="d-flex justify-content-between">
                            <div>
                                <a href="{{ route('konversi.index') }}" class="btn btn-sm btn-secondary me-2">Batal</a>
                                <button type="button" class="btn btn-sm btn-primary"
                                    id="submit-form-soal">Simpan</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
    <script src="{{ asset('assets/plugins/custom/ckeditor/ckeditor-classic.bundle.js') }}"></script>
    <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.min.js"></script>

    <script>
        let soalEditor;
        var APP_URL = window.APP_URL || "/";

        // CKEditor (readonly)
        ClassicEditor.create(document.querySelector('#soal'), {
            readOnly: true
        }).then(editor => {
            soalEditor = editor;
            editor.enableReadOnlyMode('soal');
            editor.ui.view.editable.element.style.height = '120px';
        });

        // ══════════════════════════════════════════
        //  Helpers
        // ══════════════════════════════════════════
        function escHtml(s) {
            return String(s)
                .replace(/&/g, '&amp;')
                .replace(/</g, '&lt;')
                .replace(/>/g, '&gt;')
                .replace(/"/g, '&quot;');
        }

        function normalizeJawabanCode(value) {
            if (value === null || typeof value === 'undefined') return '';

            // Jika sudah array / JSON object, extract ke plain text
            if (Array.isArray(value)) {
                return value.map(item => {
                    if (item !== null && typeof item === 'object' && item.kode) {
                        return String(item.kode).replace(/\s+$/g, '');
                    }
                    if (item !== null && typeof item === 'object') {
                        return JSON.stringify(item);
                    }
                    return String(item ?? '').replace(/\s+$/g, '');
                }).join('\n');
            }

            if (typeof value === 'object') return JSON.stringify(value, null, 2);

            let text = String(value);
            if (text.trim() === '') return '';

            try {
                const parsed = JSON.parse(text.trim());
                if (Array.isArray(parsed)) {
                    // Format baru [{kode, clue}]
                    if (parsed.length > 0 && parsed[0] !== null && typeof parsed[0] === 'object' && 'kode' in
                        parsed[0]) {
                        return parsed
                            .map(item => String(item.kode ?? '').replace(/\s+$/g, ''))
                            .filter(l => l !== '')
                            .join('\n');
                    }
                    // Format lama [string]
                    return parsed
                        .map(item => String(item ?? '').replace(/\s+$/g, ''))
                        .filter(l => l !== '')
                        .join('\n');
                }
                if (typeof parsed === 'string') text = parsed;
            } catch (e) {
                // fallback teks mentah
            }

            const normalized = String(text).replace(/\r\n/g, '\n').replace(/\r/g, '\n');
            const lines = normalized.split('\n').map(l => l.replace(/\s+$/g, ''));
            while (lines.length && lines[0].trim() === '') lines.shift();
            while (lines.length && lines[lines.length - 1].trim() === '') lines.pop();
            return lines.join('\n');
        }

        /**
         * Dari raw jawaban JSON, ambil clue indexes (0-based) yang sudah tersimpan.
         * Dipakai saat prefill edit.
         */
        function extractSavedClueIndexes(rawJawaban) {
            if (!rawJawaban || typeof rawJawaban !== 'string') return [];
            const trimmed = rawJawaban.trim();
            if (!trimmed.startsWith('[')) return [];
            try {
                const parsed = JSON.parse(trimmed);
                if (!Array.isArray(parsed)) return [];
                const indexes = [];
                parsed.forEach((item, i) => {
                    if (item !== null && typeof item === 'object' && 'kode' in item) {
                        if (parseInt(item.clue) === 1) indexes.push(i);
                    }
                });
                return indexes;
            } catch (e) {
                return [];
            }
        }

        // // ══════════════════════════════════════════
        // //  Render preview chip
        // // ══════════════════════════════════════════
        // function renderJawabanCodePreview(plainText) {
        //     const lines = plainText ? plainText.split('\n').filter(l => l.trim() !== '') : [];
        //     const $container = $('#preview-chip-wrap').empty();

        //     if (lines.length === 0) {
        //         $('#row-preview-chip').addClass('d-none');
        //         return;
        //     }

        //     lines.forEach((line) => {
        //         $container.append(`
        //             <div class="jawaban-code-card">
        //                 <span class="jawaban-code-line-content">${escHtml(line)}</span>
        //             </div>
        //         `);
        //     });

        //     $('#row-preview-chip').removeClass('d-none');
        // }

        // ══════════════════════════════════════════
        //  Render panel CLUE
        //  savedClueIndexes: array of 0-based indexes yang sudah ditandai clue
        // ══════════════════════════════════════════
        function renderCluePanel(plainText, savedClueIndexes) {
            savedClueIndexes = savedClueIndexes || [];
            const lines = plainText ? plainText.split('\n').filter(l => l.trim() !== '') : [];
            const $list = $('#clue-list').empty();

            if (lines.length === 0) {
                $('#row-clue').addClass('d-none');
                return;
            }

            lines.forEach((line, i) => {
                const isClue = savedClueIndexes.includes(i);
                const rowId = `clue-check-${i}`;

                const $row = $(`
                    <div class="clue-row ${isClue ? 'is-clue' : ''}" data-index="${i}">
                        <div class="clue-row-num">${i + 1}</div>
                        <div class="clue-row-code">${escHtml(line)}</div>
                        ${isClue ? '<span class="clue-badge">Clue</span>' : ''}
                        <label class="clue-checkbox-wrap" for="${rowId}">
                            <input type="checkbox" id="${rowId}" data-line-index="${i}"
                                class="clue-checkbox" ${isClue ? 'checked' : ''}>
                            <span class="clue-checkbox-label">Clue</span>
                        </label>
                    </div>
                `);

                $list.append($row);
            });

            $('#row-clue').removeClass('d-none');

            // Event: toggle visual saat checkbox berubah
            $list.find('.clue-checkbox').on('change', function() {
                const $row = $(this).closest('.clue-row');
                const checked = $(this).is(':checked');

                $row.toggleClass('is-clue', checked);

                // Badge clue
                $row.find('.clue-badge').remove();
                if (checked) {
                    $row.find('.clue-checkbox-wrap').before('<span class="clue-badge">Clue</span>');
                }
            });
        }

        /**
         * Kumpulkan index baris yang dicentang clue dari panel.
         * Return: array of 0-based integer indexes.
         */
        function getCheckedClueIndexes() {
            const indexes = [];
            $('#clue-list .clue-checkbox:checked').each(function() {
                indexes.push(parseInt($(this).data('line-index')));
            });
            return indexes;
        }

        // ══════════════════════════════════════════
        //  Level & Soal select
        // ══════════════════════════════════════════
        $('#level_id').on('change', function() {
            soalEditor.setData('');
            clearAll();
            const levelId = $(this).val();
            if (!levelId) {
                $('#soal_id').empty().append('<option value="" selected disabled>Pilih Soal</option>');
                return;
            }
            $.get(APP_URL + 'bank-soal-konversi/getSoalByLevel', {
                level_id: levelId
            }, function(data) {
                $('#soal_id').empty().append('<option value="" selected disabled>Pilih Soal</option>');
                $.each(data, function(_, soal) {
                    $('#soal_id').append(`<option value="${soal.id}">${soal.judul}</option>`);
                });
            });
        });

        $('#soal_id').on('change', function() {
            const soalId = $(this).val();
            clearAll();
            if (!soalId) {
                soalEditor.setData('');
                return;
            }
            $.get(APP_URL + 'soal/' + soalId, function(data) {
                soalEditor.setData(data.soal || '');
                $('#output').val(data.output || '');
                renderPseudocode(data);

                if (data.jawaban) {
                    setJawaban(data.jawaban);
                }
            });
        });

        // ══════════════════════════════════════════
        //  Render pseudocode
        // ══════════════════════════════════════════
        function renderPseudocode(data) {
            const toArray = (value) => {
                if (Array.isArray(value)) return value;
                if (value && typeof value === 'object') return [value];
                if (typeof value === 'string') {
                    const trimmed = value.trim();
                    if (!trimmed) return [];
                    try {
                        const parsed = JSON.parse(trimmed);
                        if (Array.isArray(parsed)) return parsed;
                        if (parsed && typeof parsed === 'object') return [parsed];
                    } catch (e) {
                        return [];
                    }
                }
                return [];
            };

            const tipeData = toArray(data.kunci_tipe_data);
            const algoritma = toArray(data.kunci_algoritma);

            const combined = [
                ...tipeData.map(item => ({
                    kind: 'tipe_data',
                    data: item
                })),
                ...algoritma.map(item => ({
                    kind: 'algoritma',
                    data: item
                })),
            ];

            if (combined.length === 0) {
                $('#row-pseudocode').addClass('d-none');
                return;
            }

            const container = $('#pseudo-steps').empty();

            combined.forEach((entry, index) => {
                const num = index + 1;
                let label = '';
                let klass = '';
                let badge = '';

                if (entry.kind === 'tipe_data') {
                    const variabel = entry.data.variabel ?? '-';
                    const tipe = entry.data.tipe_data ?? '-';
                    label =
                        `Variabel: <strong>${escHtml(variabel)}</strong>, Tipe: <strong>${escHtml(tipe)}</strong>`;
                    klass = 'tipe-data';
                    badge = '<span class="pseudo-badge tipe">Tipe Data</span>';
                } else {
                    label = escHtml(entry.data.langkah ?? '');
                    klass = 'algoritma';
                    badge = '<span class="pseudo-badge algo">Algoritma</span>';
                }

                container.append(`
                    <div class="pseudo-step">
                        <div class="pseudo-step-num">${num}</div>
                        <div class="pseudo-step-text ${klass}">
                            <span>${label}</span>
                            ${badge}
                        </div>
                    </div>
                `);
            });

            $('#row-pseudocode').removeClass('d-none');
        }

        // ══════════════════════════════════════════
        //  Clear semua section
        // ══════════════════════════════════════════
        function clearAll() {
            $('#jawaban-textarea').val('');
            $('#output').val('');
            $('#preview-chip-wrap').empty();
            $('#row-preview-chip').addClass('d-none');
            $('#pseudo-steps').empty();
            $('#row-pseudocode').addClass('d-none');
            $('#clue-list').empty();
            $('#row-clue').addClass('d-none');
            $('#row-input-scanner').addClass('d-none');
            $('#scanner-fields').empty();
        }

        /**
         * Set jawaban ke textarea + render preview chip + render clue panel.
         * savedClueIndexes: array index baris yg sudah ditandai clue (opsional, untuk mode edit)
         */
        function setJawaban(rawValue, savedClueIndexes) {
            const normalized = normalizeJawabanCode(rawValue);
            $('#jawaban-textarea').val(normalized);
            //renderJawabanCodePreview(normalized);
            renderCluePanel(normalized, savedClueIndexes || []);
        }

        // ══════════════════════════════════════════
        //  Live update clue panel saat textarea berubah
        // ══════════════════════════════════════════
        $('#jawaban-textarea').on('input', function() {
            const normalized = normalizeJawabanCode($(this).val());

            // Pertahankan index yang sudah dicentang sebelum re-render
            const currentChecked = getCheckedClueIndexes();

            //renderJawabanCodePreview(normalized);
            renderCluePanel(normalized, currentChecked);

            if (!codeHasScanner(normalized)) {
                $('#row-input-scanner').addClass('d-none');
                $('#scanner-fields').empty();
            }
        });

        // ══════════════════════════════════════════
        //  Scanner helpers (sama seperti sebelumnya)
        // ══════════════════════════════════════════
        function codeHasScanner(text) {
            return /\bScanner\b/.test(text);
        }

        function getScannerCallCount(line) {
            const matches = line.match(/\.\s*next(?:Int|Double|Float|Long|Line|Boolean|Short|Byte)?\s*\(\s*\)/gi);
            return matches ? matches.length : 0;
        }

        function getLoopRepeatCount(line) {
            const forMatch = line.match(/for\s*\(\s*([^;]*);\s*([^;]*);\s*([^)]+)\)/i);
            if (!forMatch) return 1;
            const init = forMatch[1];
            const condition = forMatch[2];
            const startMatch = init.match(/=\s*(-?\d+)\b/);
            const startValue = startMatch ? parseInt(startMatch[1], 10) : null;
            if (startValue === null) return 1;

            const ltMatch = condition.match(/\b([a-zA-Z_][a-zA-Z0-9_]*)\s*<\s*(-?\d+)\b/);
            if (ltMatch) return Math.max(parseInt(ltMatch[2], 10) - startValue, 1);

            const lteMatch = condition.match(/\b([a-zA-Z_][a-zA-Z0-9_]*)\s*<=\s*(-?\d+)\b/);
            if (lteMatch) return Math.max(parseInt(lteMatch[2], 10) - startValue + 1, 1);

            return 1;
        }

        function parseScannerFields(jawabanText) {
            const lines = jawabanText.split('\n').map(l => l.trim()).filter(l => l.length > 0);
            const fields = [];
            const printPattern = /System\.out\.print(?:ln)?\s*\(\s*["'](.+?)["']\s*\)/;

            for (let i = 0; i < lines.length; i++) {
                const line = lines[i];
                const scannerCount = getScannerCallCount(line);
                if (scannerCount === 0) continue;

                let label = '';
                if (i > 0 && printPattern.test(lines[i - 1])) {
                    const match = lines[i - 1].match(printPattern);
                    label = match ? match[1] : '';
                }

                const repeatCount = Math.max(
                    getLoopRepeatCount(line),
                    i > 0 ? getLoopRepeatCount(lines[i - 1]) : 1,
                    i > 1 ? getLoopRepeatCount(lines[i - 2]) : 1
                );
                const totalCount = scannerCount * repeatCount;

                for (let occ = 0; occ < totalCount; occ++) {
                    fields.push({
                        label: totalCount > 1 ? `${label || 'Input'} ${occ + 1}` : (label || 'Input'),
                        index: fields.length
                    });
                }
            }
            return fields;
        }

        function renderScannerFields(jawabanText) {
            const fields = parseScannerFields(jawabanText);
            const container = $('#scanner-fields').empty();

            if (fields.length === 0) {
                container.append(`<div class="text-muted fs-7">Tidak ada input Scanner yang terdeteksi.</div>`);
                return;
            }

            fields.forEach(field => {
                container.append(`
                    <div class="d-flex align-items-center gap-3">
                        <label class="form-label mb-0 text-nowrap"
                            style="min-width:220px;font-family:monospace;font-size:13px;">
                            ${escHtml(field.label)}
                        </label>
                        <input type="text" class="form-control form-control-sm scanner-input-field"
                            data-index="${field.index}" placeholder="Masukkan nilai..." />
                    </div>
                `);
            });
        }

        // ══════════════════════════════════════════
        //  Jalankan Konversi
        // ══════════════════════════════════════════
        async function runKonversi() {
            const levelId = $('#level_id').val();
            const soalId = $('#soal_id').val();
            const jawabanText = normalizeJawabanCode($('#jawaban-textarea').val());

            if (!levelId || !soalId) {
                Swal.fire({
                    icon: 'warning',
                    text: 'Pilih soal terlebih dahulu.',
                    confirmButtonText: 'OK'
                });
                return;
            }
            if (!jawabanText) {
                Swal.fire({
                    icon: 'warning',
                    text: 'Isi jawaban kode Java terlebih dahulu.',
                    confirmButtonText: 'OK'
                });
                return;
            }

            if (codeHasScanner(jawabanText)) {
                renderScannerFields(jawabanText);
                $('#row-input-scanner').removeClass('d-none');
                $('#scanner-fields input:first').focus();
                return;
            }

            await eksekusiJava('');
        }

        async function runWithScanner() {
            const values = [];
            let allFilled = true;

            $('.scanner-input-field').each(function() {
                const val = $(this).val().trim();
                if (!val) {
                    allFilled = false;
                    $(this).addClass('is-invalid');
                } else {
                    $(this).removeClass('is-invalid');
                    values.push(val);
                }
            });

            if (!allFilled) {
                Swal.fire({
                    icon: 'warning',
                    text: 'Semua input Scanner harus diisi.',
                    confirmButtonText: 'OK'
                });
                return;
            }

            await eksekusiJava(values.join('\n'));
        }

        async function eksekusiJava(scannerInput) {
            const levelId = $('#level_id').val();
            const soalId = $('#soal_id').val();
            const jawabanText = normalizeJawabanCode($('#jawaban-textarea').val());
            const btnKonversi = document.getElementById('btn-run-konversi');
            const btnScanner = document.getElementById('btn-run-scanner');

            btnKonversi.classList.add('loading');
            btnKonversi.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Menjalankan...';
            if (btnScanner) {
                btnScanner.disabled = true;
                btnScanner.innerHTML = '<span class="spinner-border spinner-border-sm me-2"></span>Menjalankan...';
            }

            const codes = jawabanText
                .split('\n')
                .map(l => l.trim())
                .filter(l => l.length > 0)
                .map(l => ({
                    value: l
                }));

            try {
                const res = await $.ajax({
                    type: 'POST',
                    url: APP_URL + 'bank-soal-konversi/runJava',
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        level_id: levelId,
                        soal_id: soalId,
                        codes: codes,
                        scanner_input: scannerInput
                    }
                });

                const out = (res && typeof res.output !== 'undefined') ? res.output : '';
                $('#output').val(String(out).trim());

                Swal.fire({
                    icon: 'success',
                    title: 'Berhasil Dijalankan',
                    html: `<pre style="white-space:pre-wrap;">${escHtml(String(out))}</pre>`,
                    confirmButtonText: 'OK'
                });
            } catch (xhr) {
                Swal.fire({
                    icon: 'error',
                    text: xhr?.responseJSON?.message || 'Gagal menjalankan kode Java.',
                    confirmButtonText: 'OK'
                });
            } finally {
                btnKonversi.classList.remove('loading');
                btnKonversi.innerHTML = '<i class="ki-outline ki-send fs-6"></i> Jalankan Konversi';
                if (btnScanner) {
                    btnScanner.disabled = false;
                    btnScanner.innerHTML = '<i class="ki-outline ki-play fs-6"></i> Run';
                }
            }
        }

        // ══════════════════════════════════════════
        //  Submit form — inject hidden inputs clue[]
        // ══════════════════════════════════════════
        $('#submit-form-soal').on('click', function() {
            const jawaban = normalizeJawabanCode($('#jawaban-textarea').val());
            const output = $('#output').val().trim();
            const idKonversi = $('#id_konversi').val().trim();

            if (!jawaban.trim()) {
                Swal.fire({
                    icon: 'warning',
                    text: 'Jawaban belum diisi.',
                    confirmButtonText: 'OK'
                });
                return;
            }
            if (!output) {
                Swal.fire({
                    icon: 'warning',
                    text: 'Output belum diisi. Jalankan konversi terlebih dahulu.',
                    confirmButtonText: 'OK'
                });
                return;
            }

            // Masukkan nilai jawaban yang sudah dinormalisasi
            $('#jawaban-textarea').val(jawaban);

            // Inject hidden input clue[] agar terkirim ke server
            const $hiddenWrap = $('#clue-hidden-inputs').empty();
            getCheckedClueIndexes().forEach(function(idx) {
                $hiddenWrap.append(`<input type="hidden" name="clue[]" value="${idx}">`);
            });

            if (idKonversi) {
                $('#form-soal').attr('action', APP_URL + 'bank-soal-konversi/update/' + idKonversi);
            } else {
                $('#form-soal').attr('action', APP_URL + 'bank-soal-konversi/store');
            }

            $('#form-soal').submit();
        });

        // ══════════════════════════════════════════
        //  Prefill data edit
        // ══════════════════════════════════════════
        function prefillEditData() {
            const raw = $('#data-soal').val();
            if (!raw) return;

            let existing;
            try {
                existing = JSON.parse(raw);
            } catch (e) {
                return;
            }
            if (!existing?.id_level || !existing?.id_soal) return;

            $('#id_konversi').val(existing.id);
            $('#level_id').val(existing.id_level).trigger('change.select2');

            // Ekstrak clue indexes dari jawaban yang tersimpan SEBELUM normalisasi
            const savedClueIndexes = extractSavedClueIndexes(existing.jawaban ?? '');

            $.get(APP_URL + 'bank-soal-konversi/getSoalByLevel', {
                level_id: existing.id_level
            }, function(list) {
                $('#soal_id').empty().append('<option value="" disabled>Pilih Soal</option>');
                (list || []).forEach(s => {
                    $('#soal_id').append(
                        `<option value="${s.id}" ${s.id === existing.id_soal ? 'selected' : ''}>${s.judul}</option>`
                    );
                });

                $.get(APP_URL + 'soal/' + existing.id_soal, function(detail) {
                    if (soalEditor) soalEditor.setData(detail.soal || '');
                    $('#output').val(existing.output ?? detail.output ?? '');
                    renderPseudocode(detail);

                    // Set jawaban + render clue panel dengan index tersimpan
                    const jawabanText = typeof existing.jawaban === 'string' ? existing.jawaban : '';
                    setJawaban(jawabanText, savedClueIndexes);
                });
            });
        }

        $(document).ready(function() {
            prefillEditData();
        });
    </script>
@endpush
