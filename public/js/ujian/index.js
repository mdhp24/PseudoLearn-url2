// var target = document.querySelector("#kt_app_main");
// var blockUI = new KTBlockUI(target);
var APP_URL = window.APP_URL || "/";

// $(() => {
//     blockUI.block();
//     initTable();
//     blockUI.release();
// });


function collectJawabanUser() {
    const tipe = [];
    document.querySelectorAll('.answer-box.box-tipe').forEach(box => {
        tipe.push({
            variabel: box.dataset.variable || null,
            jawaban: box.querySelector('.drag-item') ? box.querySelector('.drag-item').innerText.trim() : null
        });
    });

    const algoritma = [];
    document.querySelectorAll('.answer-box.box-algo').forEach(box => {
        algoritma.push({
            urutan: box.dataset.index || null,
            clue: box.dataset.clue === '1' ? 1 : 0,
            langkah: box.querySelector('.drag-item') ? box.querySelector('.drag-item').innerText.trim() : null
        });
    });

    return { tipe_data: tipe, algoritma: algoritma };
}

function openModalKonfirmasi() {
    const data = collectJawabanUser();
    const hidden = document.getElementById('jawaban-user');
    if (hidden) hidden.value = JSON.stringify(data);

    const modalEl = document.getElementById('modal-konfirmasi-jawaban');
    if (modalEl && typeof bootstrap !== 'undefined') new bootstrap.Modal(modalEl).show();
}

// Submit jawaban ke server
function submitForm(confidence) {
    const soalId = new URLSearchParams(window.location.search).get('id');
    const jawabanData = collectJawabanUser();

    // Ambil waktu terkini sebelum submit
    const waktu = UjianTimer.getElapsed();

    $.ajax({
        url: APP_URL + "ujian/submit",
        type: "POST",
        data: JSON.stringify({
            _token: $('meta[name="csrf-token"]').attr("content"),
            soal_id: soalId,
            jawaban: jawabanData,
            waktu: waktu,
            confidence: confidence // 1: yakin, 0: tidak yakin
        }),
        processData: false,
        contentType: "application/json",
        success: function (response) {
            if(confidence == 1) {
                if (response.correct === false) {
                    let feedbackText = '';
                    if (response.correct_tipe_data === false && response.correct_algoritma === false) {
                        feedbackText = 'Jawaban kamu salah pada Tipe Data dan Algoritma';
                    } else if (response.correct_tipe_data === false) {
                        feedbackText = response.tipe_mismatch ? response.tipe_mismatch : 'Kesalahan pada Tipe Data';
                    } else if (response.correct_algoritma === false) {
                        feedbackText = response.algoritma_mismatch ? response.algoritma_mismatch : 'Kesalahan pada Algoritma';
                    }

                    $.ajax({
                        url: APP_URL + "nyawa/status",
                        type: "GET",
                        dataType: "json",
                        headers: {
                            "Accept": "application/json",
                            "X-Requested-With": "XMLHttpRequest"
                        },
                        success: function (data) {
                            const livesEl = document.getElementById("lives-count");
                            if (livesEl) livesEl.innerText = (data && typeof data.lives !== 'undefined') ? data.lives : 0;

                            openModalFeedbackIncorrect(feedbackText, data.lives);
                        },
                        error: function (xhr) {
                            // console.error("Gagal mendapatkan status nyawa", xhr);
                        }
                    });
                } else {
                    // Jawaban benar – hentikan timer & bersihkan localStorage
                    UjianTimer.stop();
                    openModalFeedbackCorrect(response.pencapaian, response.badge);
                }
            } else if(confidence == 0) {
                $('#modal-konfirmasi-jawaban').modal('hide');
            }
        },
        error: function (xhr) {
            blockUI.release();
            Swal.fire({
                text:
                    xhr.responseJSON?.message ||
                    "Terjadi kesalahan sistem.",
                icon: "error",
                buttonsStyling: false,
                confirmButtonText: "OK",
                customClass: {
                    confirmButton: "btn btn-primary",
                },
            });
        },
    });
}

function openModalFeedbackIncorrect(feedbackText, lives = null) {
    var modal = new bootstrap.Modal(document.getElementById('modal-feedback-incorrect'));
    var modalKonfirmasi = bootstrap.Modal.getInstance(document.getElementById('modal-konfirmasi-jawaban'));
    document.getElementById('feedback-ujian').innerText = feedbackText;
    var id_level = document.getElementById('id-level').value;

    // Ganti tombol dan pesan jika nyawa habis
    if (parseInt(lives) <= 0) {
        // Ganti pesan
        document.getElementById('feedback-ujian').innerHTML = 
            '<span style="color:red;font-weight:bold;">Nyawa anda sudah habis, harap menunggu nyawa bertambah.</span>';

        // Ganti tombol modal
        var modalFooter = document.querySelector('#modal-feedback-incorrect .modal-footer');
        if (modalFooter) {
            modalFooter.innerHTML = `<button type="button" class="btn btn-primary" onclick="window.location.href='${APP_URL}quiz/question-list?level=${id_level}'">Kembali ke Daftar Soal</button>`;
        }

        // Sembunyikan tombol silang (X) pada header modal
        var closeBtn = document.querySelector('#modal-feedback-incorrect .btn-close');
        if (closeBtn) closeBtn.style.display = 'none';
    } else {
        // Tampilkan kembali tombol silang jika masih ada nyawa
        var closeBtn = document.querySelector('#modal-feedback-incorrect .btn-close');
        if (closeBtn) closeBtn.style.display = '';
    }

    if (modalKonfirmasi) {
        modalKonfirmasi.hide();
    }
    modal.show();
}

function openModalFeedbackCorrect(pencapaian = null, badge = null) {
    var modal = new bootstrap.Modal(document.getElementById('modal-feedback-correct'));
    var modalKonfirmasi = bootstrap.Modal.getInstance(document.getElementById('modal-konfirmasi-jawaban'));
    if (modalKonfirmasi) {
        modalKonfirmasi.hide();
    }
    modal.show();
    // console.log(pencapaian, badge);
    // Setelah klik tombol selesai, redirect dengan parameter pencapaian
    document.querySelector('#modal-feedback-correct .btn-primary').onclick = function() {
        let url = `${APP_URL}quiz/question-list?level=${document.getElementById('id-level').value}`;
        if (pencapaian) {
            url += `&pencapaian_id=${encodeURIComponent(pencapaian.id)}`;
        }
        if (badge) {
            url += `&badge_id=${encodeURIComponent(badge.id)}`;
        }
        window.location.href = url;
    };
}

/**
 * UjianTimer – production-ready timer untuk halaman ujian.
 *
 * Cara kerja:
 *  - start_time disimpan di localStorage dengan key per soalId
 *  - Menggunakan mekanisme last_tick untuk membedakan reload vs ditinggalkan lama.
 *  - Hanya dimulai saat start() dipanggil pertama kali (drag & drop pertama).
 */
/**
 * UjianTimer – Akurasi 1:1 untuk pengerjaan soal.
 *
 * Menggunakan mekanisme akumulasi detik agar:
 * 1. Timer benar-benar berhenti saat tab ditutup/reload/pindah (tidak menghitung waktu "away").
 * 2. Timer melanjutkan (resume) dari detik terakhir saat halaman dibuka kembali.
 * 3. Tidak terjadi lonjakan waktu (bug 13 menit) atau reset prematur (bug 32 detik).
 */
const UjianTimer = (function () {
    'use strict';

    const _soalId = new URLSearchParams(window.location.search).get('id') || 'unknown';
    const _STORAGE_ACC   = 'ujian_acc_' + _soalId; // Total detik yang sudah terkumpul
    const _STORAGE_STATE = 'ujian_state_' + _soalId; // 'running' or 'stopped'

    let _rafId          = null;
    let _isRunning      = false;
    let _sessionStart   = null; // Waktu (ms) saat sesi aktif dimulai
    let _accumulatedSec = 0;    // Detik dari sesi sebelumnya

    function _getEl() { return document.getElementById('timer-ujian'); }

    function _getNavigationType() {
        const navEntry = performance.getEntriesByType && performance.getEntriesByType('navigation')[0];
        if (navEntry && navEntry.type) {
            return navEntry.type;
        }

        if (performance.navigation && typeof performance.navigation.type === 'number') {
            if (performance.navigation.type === 1) return 'reload';
            if (performance.navigation.type === 2) return 'back_forward';
        }

        return 'navigate';
    }

    function _clearStoredState() {
        localStorage.removeItem(_STORAGE_ACC);
        localStorage.removeItem(_STORAGE_STATE);
    }

    function _render(totalSec) {
        const el = _getEl();
        if (!el) return;
        const h = String(Math.floor(totalSec / 3600)).padStart(2, '0');
        const m = String(Math.floor((totalSec % 3600) / 60)).padStart(2, '0');
        const s = String(totalSec % 60).padStart(2, '0');
        el.textContent = h + ':' + m + ':' + s;
    }

    function _tick() {
        if (!_isRunning) return;
        
        const currentSessionSec = Math.floor((Date.now() - _sessionStart) / 1000);
        const totalSec = _accumulatedSec + currentSessionSec;
        
        _render(totalSec);
        _rafId = requestAnimationFrame(_tick);
    }

    function init() {
        // Saat masuk dari navigasi baru, reset timer agar tidak mewarisi sesi lama.
        if (_getNavigationType() === 'navigate') {
            _clearStoredState();
        }

        // Load data lama jika ada
        const savedAcc = localStorage.getItem(_STORAGE_ACC);
        if (savedAcc !== null) {
            _accumulatedSec = parseInt(savedAcc, 10) || 0;
        }

        // Render nilai awal
        _render(_accumulatedSec);

        // Jika sebelumnya sedang jalan (misal: reload mendadak), otomatis lanjut
        if (localStorage.getItem(_STORAGE_STATE) === 'running') {
            start();
        }

        window.addEventListener('beforeunload', _onBeforeUnload);
    }

    function start() {
        if (_isRunning) return;
        
        _isRunning = true;
        _sessionStart = Date.now();
        localStorage.setItem(_STORAGE_STATE, 'running');
        
        _rafId = requestAnimationFrame(_tick);
    }

    function _onBeforeUnload() {
        if (!_isRunning) return;

        // Hitung total saat ini dan simpan ke localStorage
        const currentSessionSec = Math.floor((Date.now() - _sessionStart) / 1000);
        const totalSec = _accumulatedSec + currentSessionSec;
        
        localStorage.setItem(_STORAGE_ACC, String(totalSec));
        // Kita tidak hapus STATE 'running' agar saat reload otomatis start lagi

        // Kirim ke backend (Beacon)
        const token   = (document.querySelector('meta[name="csrf-token"]') || {}).content || '';
        const payload = JSON.stringify({
            _token  : token,
            soal_id : _soalId,
            waktu   : totalSec,
            source  : 'beforeunload'
        });

        const url = (window.APP_URL || '/') + 'ujian/save-timer';
        if (navigator.sendBeacon) {
            navigator.sendBeacon(url, new Blob([payload], { type: 'application/json' }));
        }
    }

    function getElapsed() {
        if (!_isRunning) return _accumulatedSec;
        const currentSessionSec = Math.floor((Date.now() - _sessionStart) / 1000);
        return _accumulatedSec + currentSessionSec;
    }

    function isStarted() {
        return _isRunning || _accumulatedSec > 0;
    }

    function stop() {
        _isRunning = false;
        if (_rafId) cancelAnimationFrame(_rafId);
        
        window.removeEventListener('beforeunload', _onBeforeUnload);
        _clearStoredState();
    }

    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }

    return { getElapsed: getElapsed, isStarted: isStarted, start: start, stop: stop };
}());

// Backward-compat: beberapa tempat masih memanggil startUjianTimer()
function startUjianTimer() { UjianTimer.start(); }

// Backward-compat: Chatbot Adaptive & sistem log lama menggunakan variabel global
Object.defineProperty(window, 'timerElapsed', {
    get: function() { return UjianTimer.getElapsed(); }
});
Object.defineProperty(window, 'timerStarted', {
    get: function() { return UjianTimer.isStarted(); } 
});

function logAnswerDrop({ type, itemText, variabel = null, index = null }) {
    try {
        const soalId = new URLSearchParams(window.location.search).get('id');
        if (!soalId) return;

        $.ajax({
            url: APP_URL + "ujian/send-log",
            type: "POST",
            data: JSON.stringify({
                _token: $('meta[name="csrf-token"]').attr("content"),
                soal_id: soalId,
                jenis: type,
                item: itemText,
                variabel: variabel,
                index: index,
                timer_second: UjianTimer.getElapsed()
            }),
            processData: false,
            contentType: "application/json",
            error: function (xhr) {
                Swal.fire({
                    text: xhr.responseJSON?.message || "Terjadi kesalahan sistem.",
                    icon: "error",
                    confirmButtonText: "OK",
                    customClass: {
                        confirmButton: "btn btn-primary",
                    },
                });
            }
        });
    } catch (e) {
        console.error("Gagal mengirim log:", e);
    }
}

// (PATCH) di handler drop answer-box, setelah this.appendChild(dragged); tambahkan pemicu startUjianTimer()
document.addEventListener('dragstart', function (e) {
    const dragged = e.target && e.target.closest ? e.target.closest('.drag-item') : null;
    if (!dragged) return;

    startUjianTimer();
});

document.querySelectorAll('.answer-box').forEach(box => {
    box.addEventListener('dragover', e => e.preventDefault());
    box.addEventListener('drop', function (e) {
        e.preventDefault();
        const dragged = document.querySelector('.dragging');
        if (!dragged) return;

        const sourceClass = dragged.getAttribute('data-source');
        const isBoxTipe = this.classList.contains('box-tipe');
        const isBoxAlgo = this.classList.contains('box-algo');

        if ((isBoxTipe && sourceClass !== 'tipe') || (isBoxAlgo && sourceClass !== 'algo')) {
            this.classList.add('shake');
            if (!this.querySelector('.error-msg')) {
                const msg = isBoxTipe ? 'Ini adalah bagian answer-box tipe data!' : 'Ini adalah bagian answer-box Algoritma!';
                const errorMsg = document.createElement('div');
                errorMsg.className = 'error-msg';
                errorMsg.style.color = 'red';
                errorMsg.style.fontWeight = 'bold';
                errorMsg.style.marginLeft = '8px';
                errorMsg.innerText = msg;
                this.appendChild(errorMsg);
                setTimeout(() => { errorMsg.remove(); this.classList.remove('shake'); }, 2000);
            }
            return;
        }

        // Cegah isi lebih dari satu (hanya 1 jawaban per box)
        if (this.querySelector('.drag-item')) {
            this.classList.add('shake');
            setTimeout(() => this.classList.remove('shake'), 400);
            return;
        }

        this.appendChild(dragged);
        dragged.classList.remove('dragging');

        // LOG hanya saat sukses isi answer-box
        const itemText = dragged.innerText.trim();
        if (isBoxTipe) {
            logAnswerDrop({
                type: 'tipe_data',
                itemText,
                variabel: this.dataset.variable || null
            });
        } else if (isBoxAlgo) {
            logAnswerDrop({
                type: 'algoritma',
                itemText,
                index: this.dataset.index || null
            });
        }

        startUjianTimer();
    });
});

// Hitung langkah juga saat jawaban dikembalikan ke panel pertanyaan.
document.querySelectorAll('.panel-body, .panel-body-algoritma').forEach(panel => {
    panel.addEventListener('dragover', e => e.preventDefault());

    panel.addEventListener('drop', function (e) {
        e.preventDefault();
        const dragged = document.querySelector('.dragging');
        if (!dragged) return;

        const panelIsTipe = this.classList.contains('panel-body');
        const panelIsAlgo = this.classList.contains('panel-body-algoritma');
        const sourceClass = dragged.getAttribute('data-source');

        if ((panelIsTipe && sourceClass !== 'tipe') || (panelIsAlgo && sourceClass !== 'algo')) {
            this.classList.add('shake');
            setTimeout(() => this.classList.remove('shake'), 400);
            return;
        }

        const sourceParent = dragged.parentElement;
        const sourceWasAnswerBox = sourceParent && sourceParent.classList.contains('answer-box');
        const sourceVariabel = sourceWasAnswerBox ? (sourceParent.dataset.variable || null) : null;
        const sourceIndex = sourceWasAnswerBox ? (sourceParent.dataset.index || null) : null;

        if (sourceWasAnswerBox) {
            sourceParent.removeChild(dragged);
        }

        this.appendChild(dragged);
        dragged.classList.remove('dragging');

        if (sourceWasAnswerBox) {
            const itemText = dragged.innerText.trim();
            if (sourceClass === 'tipe') {
                logAnswerDrop({
                    type: 'tipe_data',
                    itemText,
                    variabel: sourceVariabel
                });
            } else if (sourceClass === 'algo') {
                logAnswerDrop({
                    type: 'algoritma',
                    itemText,
                    index: sourceIndex
                });
            }
        }
    });
});

function reloadUjian() {
    Swal.fire({
        title: 'Muat Ulang Ujian?',
        text: "Jawaban sebelumnya akan hilang.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak'
    }).then((result) => {
        if (result.isConfirmed) {
            location.reload();
        }
    });
}

function back(id_level){
    Swal.fire({
        title: 'Kembali ke Daftar Soal?',
        text: "Jawaban sebelumnya akan hilang.",
        icon: 'warning',
        showCancelButton: true,
        confirmButtonText: 'Ya',
        cancelButtonText: 'Tidak'
    }).then((result) => {
        if (result.isConfirmed) {
            window.location.href = APP_URL + "quiz/question-list?level=" + id_level;
        }
    });
}