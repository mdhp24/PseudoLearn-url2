var APP_URL = window.APP_URL || "/";

function buildQuizQuestionListUrl(levelId) {
    const base = window.QUIZ_QUESTION_LIST_URL || (APP_URL + "quiz/question-list-z");
    return base + "?level=" + encodeURIComponent(levelId);
}

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
            window.location.href = buildQuizQuestionListUrl(id_level);
        }
    });
}

function openModalGuide() {
    var el = document.getElementById('modal-guide');
    if (el && typeof bootstrap !== 'undefined') bootstrap.Modal.getOrCreateInstance(el).show();
}

function openModalKonfirmasi() {
    var el = document.getElementById('modal-konfirmasi-jawaban-konversi');
    if (el && typeof bootstrap !== 'undefined') bootstrap.Modal.getOrCreateInstance(el).show();
}

function openModalFeedback() {
    var el = document.getElementById('modal-feedback');
    if (el && typeof bootstrap !== 'undefined') {
        var modal = bootstrap.Modal.getOrCreateInstance(el);
        var modalKonfirmasi = bootstrap.Modal.getInstance(document.getElementById('modal-konfirmasi-jawaban-konversi'));
        if (modalKonfirmasi) {
            modalKonfirmasi.hide();
        }
        modal.show();
    }
}

// Global safeguard: Hapus backdrop abu-abu yang tertinggal saat modal ditutup
document.addEventListener('hidden.bs.modal', function () {
    const openModals = document.querySelectorAll('.modal.show');
    if (openModals.length === 0) {
        document.querySelectorAll('.modal-backdrop').forEach(b => b.remove());
        document.body.classList.remove('modal-open');
        document.body.style.overflow = '';
        document.body.style.paddingRight = '';
    }
});

function submitKonversi() {
    var modalKonfirmasi = bootstrap.Modal.getInstance(document.getElementById('modal-konfirmasi-jawaban-konversi'));
    var inputs = document.querySelectorAll('.input-panel input[type="text"]');
    var kodeLangkah = [];
    var waktu = $('#waktu-ujian-detik').val();
    inputs.forEach(function(input) {
        kodeLangkah.push(input.value);
    });

    // hapus semua is-invalid
    inputs.forEach(function(input) {
        input.classList.remove("is-invalid");
    });

    $.ajax({
        url: APP_URL + 'ujian-kode/submit-konversi',
        type: 'POST',
        data: {
            _token: $('meta[name="csrf-token"]').attr('content'),
            id_soal_konversi: $('#id-soal-konversi').val(),
            kode_langkah: kodeLangkah,
            waktu: waktu
        },
        success: function(response) {
            modalKonfirmasi.hide();

            // Jika benar, tampilkan modal correct dan hasil run Java
            var modalCorrectEl = document.getElementById('modal-feedback-correct-konversi');
            if (modalCorrectEl && typeof bootstrap !== 'undefined') {
                var modalCorrect = bootstrap.Modal.getOrCreateInstance(modalCorrectEl);
                document.getElementById('java-run-result').textContent = response.java_output || '';
                modalCorrect.show();
            }

            var btnLanjut = document.querySelector('#modal-feedback-correct-konversi .btn-primary');
            if (btnLanjut) {
                btnLanjut.onclick = function() {
                    let url = `${APP_URL}quiz/question-list?level=${document.getElementById('id-level').value}`;
                    if (response.konversi) {
                        url += `&konversi_id=${encodeURIComponent(response.konversi.id)}`;
                    }
                    window.location.href = url;
                };
            }
        },
        error: function(xhr) {
            const res = xhr.responseJSON;

            if (res?.message?.errors) {
                let inputs = document.querySelectorAll('.input-panel input[type="text"]');
                res.message.errors.forEach(err => {
                    inputs[err.index].classList.add("is-invalid");
                });
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

                    openModalFeedbackIncorrect(res?.message?.message ?? 'Terdapat jawaban salah', data.lives);
                },
                error: function (xhr) {
                    // console.error("Gagal mendapatkan status nyawa", xhr);
                }
            });
            // modalKonfirmasi.hide();
        }
    });
}

function openModalFeedbackIncorrect(feedbackText, lives = null) {
    var modalIncorrectEl = document.getElementById('modal-feedback-incorrect-konversi');
    if (!modalIncorrectEl || typeof bootstrap === 'undefined') return;

    var modalIncorrect = bootstrap.Modal.getOrCreateInstance(modalIncorrectEl);
    var modalKonfirmasi = bootstrap.Modal.getInstance(document.getElementById('modal-konfirmasi-jawaban-konversi'));
    var id_level = document.getElementById('id-level').value;

    // Ganti pesan dan tombol jika nyawa habis
    if (parseInt(lives) <= 0) {
        var fbEl = document.getElementById('feedback-ujian-konversi');
        if (fbEl) {
            fbEl.innerHTML =
                '<span style="color:red;font-weight:bold;">Nyawa anda sudah habis, harap menunggu nyawa bertambah.</span>';
        }

        // Ganti tombol modal
        var modalFooter = document.querySelector('#modal-feedback-incorrect-konversi .modal-footer');
        if (modalFooter) {
            modalFooter.innerHTML = `<button type="button" class="btn btn-primary" onclick="window.location.href='${buildQuizQuestionListUrl(id_level)}'">Kembali ke Daftar Soal</button>`;
        }

        // Sembunyikan tombol silang (X) pada header modal
        var closeBtn = document.querySelector('#modal-feedback-incorrect-konversi .btn-close');
        if (closeBtn) closeBtn.style.display = 'none';
    } else {
        // Tampilkan kembali tombol silang jika masih ada nyawa
        var closeBtn = document.querySelector('#modal-feedback-incorrect-konversi .btn-close');
        if (closeBtn) closeBtn.style.display = '';
    }

    if (modalKonfirmasi) {
        modalKonfirmasi.hide();
    }
    modalIncorrect.show();
}
