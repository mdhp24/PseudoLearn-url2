@extends('layouts.main')

@push('styles')
    <style>
        .form-select {
            width: 200px;
        }

        .detail-summary {
            border-radius: 22px;
            padding: 1.25rem 1.5rem;
            margin-bottom: 1.5rem;
            color: #ffffff;
            background: linear-gradient(135deg, #366cad 0%, #b8d9ff 100%);
            box-shadow: 0 14px 30px rgba(92, 158, 239, 0.16);
        }

        .detail-summary-label {
            font-size: 0.78rem;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            opacity: 0.8;
            margin-bottom: 0.35rem;
        }

        .detail-summary-name {
            font-size: 1.25rem;
            font-weight: 700;
            line-height: 1.25;
            margin-bottom: 0.8rem;
        }

        .detail-summary-chips {
            display: flex;
            flex-wrap: wrap;
            gap: 0.5rem;
        }

        .detail-summary-chip {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            padding: 0.45rem 0.8rem;
            border-radius: 999px;
            background: rgba(255, 255, 255, 0.12);
            border: 1px solid rgba(255, 255, 255, 0.18);
            backdrop-filter: blur(8px);
            font-size: 0.88rem;
            white-space: nowrap;
        }

        .detail-summary-chip strong {
            font-weight: 700;
        }

        #table-detail-chatbot td:nth-child(3) {
            min-width: 280px;
            white-space: normal;
            word-break: break-word;
        }
    </style>
@endpush

@section('content')
    <div class="container-fluid px-4" id="log-data-chatbot-container">
        <div class="row">
            <div class="col-12 px-0">
                <div class="bg-white rounded-4 shadow-sm p-8">

                    <div class="d-flex justify-content-between align-items-center mb-10">
                        <div class="d-flex gap-2">
                            <input type="text" class="form-control form-control-sm w-250px"
                                placeholder="Cari Mahasiswa" id="search-mahasiswa" />
                        </div>

                        <div class="d-flex gap-3 align-items-center">
                            <select class="form-select form-select-sm" id="filter-kelas"
                                data-control="select2" data-hide-search="true" data-allow-clear="false">
                                @foreach ($list_kelas ?? [] as $kelas)
                                    <option value="{{ $kelas['id'] }}">
                                        {{ $kelas['name'] }}
                                        @if (!empty($kelas['angkatan']))
                                            ({{ $kelas['angkatan'] }})
                                        @endif
                                    </option>
                                @endforeach
                            </select>

                            <select class="form-select form-select-sm" id="filter-level"
                                data-control="select2" data-hide-search="true" data-allow-clear="true">
                                <option value="">Pilih Level</option>
                                @foreach ($list_level ?? [] as $level)
                                    <option value="{{ $level['id'] }}">{{ $level['name'] }}</option>
                                @endforeach
                            </select>

                            <select class="form-select form-select-sm" id="filter-soal"
                                data-control="select2" data-hide-search="true" data-allow-clear="true">
                                <option value="">Pilih Soal</option>
                            </select>

                            <button type="button" class="btn btn-success btn-sm" onclick="exportExcel()">
                                <i class="ki-outline ki-file-up"></i> Export
                            </button>
                        </div>
                    </div>

                    <div class="table-responsive">
                        <table class="table table-striped" id="table-log-data-chatbot">
                            <thead>
                                <tr class="fw-semibold fs-6 text-gray-800 border-bottom border-gray-200">
                                    <th class="text-center">No</th>
                                    <th class="text-start">NIM</th>
                                    <th class="text-start">Nama</th>
                                    <th class="text-center">Kelas</th>
                                    <th class="text-center">Log Chatbot</th>
                                    <th class="text-center">Aksi</th>
                                </tr>
                            </thead>
                            <tbody>
                                {{-- Data diload via DataTables --}}
                            </tbody>
                        </table>
                    </div>

                </div>
            </div>
        </div>
    </div>

    {{-- ===================== Modal Detail Riwayat ===================== --}}
    <div class="modal fade" tabindex="-1" id="modal-detail-chatbot">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">

                <div class="modal-header">
                    <h3 class="modal-title">Detail Log Chatbot</h3>
                    <div class="btn btn-icon btn-sm btn-active-light-primary ms-2"
                        data-bs-dismiss="modal" aria-label="Close">
                        <i class="ki-duotone ki-cross fs-1">
                            <span class="path1"></span>
                            <span class="path2"></span>
                        </i>
                    </div>
                </div>

                <div class="modal-body">

                    <div class="detail-summary">
                        <div class="detail-summary-label">Detail Mahasiswa</div>
                        <div id="detail-hero-nama" class="detail-summary-name">-</div>
                        <div class="detail-summary-chips">
                            <span class="detail-summary-chip">
                                NIM <strong id="detail-hero-nim">-</strong>
                            </span>
                            <span class="detail-summary-chip">
                                Kelas <strong id="detail-hero-kelas">-</strong>
                            </span>
                            <span class="detail-summary-chip">
                                Total Akses <strong id="detail-hero-total-chatbot">0</strong>
                            </span>
                        </div>
                    </div>

                    <div class="separator my-5"></div>

                    <h5 class="fw-bold mb-4">Riwayat Akses Chatbot</h5>

                    <div class="table-responsive">
                        <table class="table table-row-bordered table-striped align-middle"
                            id="table-detail-chatbot">
                            <thead>
                                <tr class="fw-semibold fs-7 text-gray-800 border-bottom border-gray-200">
                                    <th class="text-center">No</th>
                                    <th class="text-center">Level</th>
                                    <th class="text-start">Soal</th>
                                    <th class="text-center">Waktu Akses</th>
                                    <th class="text-center">Durasi (menit)</th>
                                    <th class="text-center">Lihat Pesan</th>
                                </tr>
                            </thead>
                            <tbody id="detail-chatbot-body">
                                {{-- Diisi via JS --}}
                            </tbody>
                        </table>
                    </div>

                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light btn-sm" data-bs-dismiss="modal">
                        Tutup
                    </button>
                </div>

            </div>
        </div>
    </div>

    {{-- ===================== Modal Percakapan Chatbot ===================== --}}
    <div class="modal fade" id="modalPercakapanChatbot" tabindex="-1"
        aria-labelledby="modalPercakapanChatbotLabel" aria-hidden="true">
        <div class="modal-dialog modal-xl modal-dialog-scrollable">
            <div class="modal-content">

                <div class="modal-header">
                    <h5 class="modal-title fw-bold" id="modalPercakapanChatbotLabel">
                        <i class="bi bi-chat-dots me-2"></i>History Percakapan Chatbot
                    </h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
                </div>

                <div class="modal-body p-0">
                    <div class="table-responsive">
                        <table class="table table-row-bordered table-striped align-middle mb-0">
                            <thead class="sticky-top bg-white">
                                <tr class="fw-semibold fs-7 text-gray-800 border-bottom border-gray-200">
                                    <th class="text-center px-4">No</th>
                                    <th class="text-center">Waktu</th>
                                    <th class="text-center">Level</th>
                                    <th class="text-start">Soal</th>
                                    <th class="text-center">Pengirim</th>
                                    <th class="text-start">Pesan</th>
                                </tr>
                            </thead>
                            <tbody id="detail-chatbot-conversation-body">
                                <tr>
                                    <td colspan="6" class="text-center text-muted py-5">
                                        Belum ada percakapan chatbot
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                        Tutup
                    </button>
                </div>

            </div>
        </div>
    </div>

@endsection

@push('scripts')
    <script src="{{ asset('js/logDataChatbot/index.js') }}"></script>
@endpush