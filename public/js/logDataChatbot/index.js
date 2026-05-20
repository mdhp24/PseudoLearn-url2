var target   = document.querySelector("#kt_app_body");
var blockUI  = new KTBlockUI(target);
var APP_URL  = window.APP_URL || "/";

$(() => {
    blockUI.block();
    initTable();
    resetSoalSelect();
    blockUI.release();
});

var dataTable = null;

// ─── Helpers ────────────────────────────────────────────────────────────────

function escapeHtml(value) {
    return String(value ?? "")
        .replaceAll("&",  "&amp;")
        .replaceAll("<",  "&lt;")
        .replaceAll(">",  "&gt;")
        .replaceAll('"',  "&quot;")
        .replaceAll("'",  "&#39;");
}

function renderLevelBadge(levelName) {
    const label = (levelName ?? "-").toString();
    return `<span class="badge badge-light-primary fs-7">${escapeHtml(label)}</span>`;
}

// ─── DataTable Utama ─────────────────────────────────────────────────────────

function initTable() {
    return new Promise((resolve, reject) => {
        if (dataTable) {
            dataTable.ajax.reload();
            resolve(true);
            return;
        }

        dataTable = $("#table-log-data-chatbot").DataTable({
            ajax: {
                url:  APP_URL + "log-data-chatbot/table",
                type: "POST",
                data: function (d) {
                    d._token = $('meta[name="csrf-token"]').attr("content");
                    d.kelas  = $("#filter-kelas").val() || null;
                    d.level  = $("#filter-level").val() || null;
                    d.soal   = $("#filter-soal").val()  || null;
                },
            },

            processing: true,
            serverSide: true,
            destroy:    false,
            responsive: false,
            order:      [[1, "asc"]],

            columns: [
                { data: null,           className: "text-center", orderable: false, searchable: false },
                { data: "nim",          orderable: true,  searchable: true },
                { data: "name",         orderable: true,  searchable: true },
                { data: "kelas_name",   orderable: true,  searchable: true,  className: "text-center" },
                { data: "jumlah_chatbot", orderable: true, searchable: false, className: "text-center" },
                { data: "id",           orderable: false, searchable: false,  className: "text-center" },
            ],

            columnDefs: [
                {
                    targets: 0,
                    render: (data, type, row, meta) => meta.row + 1,
                },
                {
                    targets: 1,
                    render: (data, type, row) => escapeHtml(row.nim ?? "-"),
                },
                {
                    targets: 2,
                    render: (data, type, row) => escapeHtml(row.name ?? "-"),
                },
                {
                    targets: 3,
                    render: (data, type, row) => escapeHtml(row.kelas_name ?? "-"),
                },
                {
                    targets: 4,
                    render: (data, type, row) =>
                        `<span class="badge badge-light-primary fs-7">${row.jumlah_chatbot ?? 0}</span>`,
                },
                {
                    targets: 5,
                    render: (data, type, row) => `
                        <div class="d-flex justify-content-center">
                            <button
                                type="button"
                                class="btn btn-sm btn-outline btn-outline-primary d-flex align-items-center gap-1 p-2"
                                onclick="showDetail('${row.id}')">
                                <i class="ki-outline ki-eye"></i>
                                <span>Detail</span>
                            </button>
                        </div>`,
                },
            ],

            createdRow: (row, data) => {
                $(row).attr("id", data.id || data[0]);
            },

            initComplete: function () {
                var debounceTimer;
                $("#search-mahasiswa").on("keyup", function () {
                    clearTimeout(debounceTimer);
                    debounceTimer = setTimeout(() => {
                        dataTable.search($(this).val()).draw();
                    }, 300);
                });
                resolve(true);
            },
        });
    });
}

// ─── Render Tabel Riwayat (modal pertama) ───────────────────────────────────

function renderDetailTable(historyData) {
    const tbody = document.getElementById("detail-chatbot-body");
    if (!tbody) return;

    if (!historyData || historyData.length === 0) {
        tbody.innerHTML = `
            <tr>
                <td colspan="6" class="text-center text-muted py-5">
                    Belum ada riwayat akses chatbot
                </td>
            </tr>`;
        return;
    }

    tbody.innerHTML = historyData.map((item, index) => {
        const conversation    = item.conversation ?? [];
        const conversationJson = escapeHtml(JSON.stringify(conversation));
        const jumlahPesan     = conversation.length;

        const lihatPesanBtn = jumlahPesan > 0
            ? `<button
                    type="button"
                    class="btn btn-sm btn-light-primary btn-lihat-pesan"
                    data-conversation="${conversationJson}">
                    <i class="bi bi-chat-dots me-1"></i>${jumlahPesan} Pesan
               </button>`
            : `<span class="text-muted fs-7">—</span>`;

        return `
            <tr>
                <td class="text-center">${index + 1}</td>
                <td class="text-center">${renderLevelBadge(item.level_name ?? "-")}</td>
                <td class="text-start">${escapeHtml(item.soal ?? "-")}</td>
                <td class="text-center text-nowrap">${escapeHtml(item.waktu_akses ?? "-")}</td>
                <td class="text-center">${escapeHtml(item.durasi ?? "-")}</td>
                <td class="text-center">${lihatPesanBtn}</td>
            </tr>`;
    }).join("");
}

// ─── Render Tabel Percakapan (modal kedua) ───────────────────────────────────

function renderConversationTable(conversation) {
    const tbody = document.getElementById("detail-chatbot-conversation-body");
    if (!tbody) return;

    if (!conversation || conversation.length === 0) {
        tbody.innerHTML = `
            <tr>
                <td colspan="6" class="text-center text-muted py-5">
                    Belum ada percakapan chatbot
                </td>
            </tr>`;
        return;
    }

    tbody.innerHTML = conversation.map((item, index) => `
        <tr>
            <td class="text-center px-4">${index + 1}</td>
            <td class="text-center text-nowrap">${escapeHtml(item.timestamp ?? "-")}</td>
            <td class="text-center">${renderLevelBadge(item.level_name ?? "-")}</td>
            <td class="text-start">${escapeHtml(item.soal_name ?? "-")}</td>
            <td class="text-center">
                <span class="badge ${item.speaker === "Siswa" ? "badge-light-info" : "badge-light-success"}">
                    <i class="bi ${item.speaker === "Siswa" ? "bi-person" : "bi-robot"} me-1"></i>
                    ${escapeHtml(item.speaker ?? "-")}
                </span>
            </td>
            <td class="text-start">
                <div style="white-space: pre-wrap; word-break: break-word; max-width: 400px;">
                    ${escapeHtml(item.message ?? "-")}
                </div>
            </td>
        </tr>
    `).join("");
}

// ─── Event: Klik tombol "Lihat Pesan" ────────────────────────────────────────

document.addEventListener("click", function (e) {
    const btn = e.target.closest(".btn-lihat-pesan");
    if (!btn) return;

    const conversation = JSON.parse(btn.dataset.conversation || "[]");
    renderConversationTable(conversation);

    const modalEl = document.getElementById("modalPercakapanChatbot");
    // Hindari duplikat instance Bootstrap modal
    const existing = bootstrap.Modal.getInstance(modalEl);
    if (existing) {
        existing.show();
    } else {
        new bootstrap.Modal(modalEl).show();
    }
});

// ─── Show Detail (modal pertama) ─────────────────────────────────────────────

function showDetail(idMahasiswa) {
    blockUI.block();

    $.ajax({
        url:  APP_URL + "log-data-chatbot/detail/" + idMahasiswa,
        type: "GET",
        data: { _token: $('meta[name="csrf-token"]').attr("content") },

        success: function (res) {
            if (res.success) {
                const data = res.data;

                $("#detail-hero-nama").text(data.name          ?? "-");
                $("#detail-hero-nim").text(data.nim            ?? "-");
                $("#detail-hero-kelas").text(data.kelas_name   ?? "-");
                $("#detail-hero-total-chatbot").text(data.jumlah_chatbot ?? 0);

                // Render tabel riwayat + tombol Lihat Pesan
                renderDetailTable(data.history ?? []);

                $("#modal-detail-chatbot").modal("show");
            } else {
                Swal.fire({
                    icon:  "error",
                    title: "Gagal",
                    text:  res.message ?? "Terjadi kesalahan saat memuat data",
                });
            }

            blockUI.release();
        },

        error: function () {
            blockUI.release();
            Swal.fire({
                icon:  "error",
                title: "Gagal",
                text:  "Terjadi kesalahan saat memuat data",
            });
        },
    });
}

// ─── Fix scroll-lock setelah modal ditutup ────────────────────────────────────

function fixScrollLock() {
    $("body").removeClass("modal-open");
    $("body").css({ overflow: "", "padding-right": "" });
    // Hapus backdrop hanya jika tidak ada modal lain yang terbuka
    if ($(".modal.show").length === 0) {
        $(".modal-backdrop").remove();
    }
}

$("#modal-detail-chatbot").on("hidden.bs.modal", fixScrollLock);
$("#modalPercakapanChatbot").on("hidden.bs.modal", function () {
    // Saat modal percakapan ditutup, modal detail masih terbuka → jaga backdrop
    if ($("#modal-detail-chatbot").hasClass("show")) {
        $("body").addClass("modal-open");
    } else {
        fixScrollLock();
    }
});

// ─── Filter & Export ──────────────────────────────────────────────────────────

function resetSoalSelect() {
    $("#filter-soal")
        .html('<option value="">Pilih Soal</option>')
        .val("")
        .prop("disabled", true)
        .trigger("change.select2");
}

$("#filter-level").on("change", function () {
    const levelId = $(this).val();

    if (!levelId) {
        resetSoalSelect();
        initTable();
        return;
    }

    $.ajax({
        url:  APP_URL + "log-data-chatbot/getSoalByLevel",
        type: "GET",
        data: { level_id: levelId, _token: $('meta[name="csrf-token"]').attr("content") },

        success: function (res) {
            let opts = '<option value="">Pilih Soal</option>';
            (res || []).forEach((s) => {
                opts += `<option value="${s.id}">${escapeHtml(s.judul)}</option>`;
            });

            $("#filter-soal")
                .html(opts)
                .val("")
                .prop("disabled", false)
                .trigger("change.select2");

            initTable();
        },

        error: function () {
            resetSoalSelect();
        },
    });
});

$("#filter-kelas").on("change", () => initTable());
$("#filter-soal").on("change",  () => initTable());

function exportExcel() {
    const kelas = $("#filter-kelas").val();
    const level = $("#filter-level").val();
    const soal  = $("#filter-soal").val();

    const form  = document.createElement("form");
    form.method = "POST";
    form.action = APP_URL + "log-data-chatbot/export";
    form.style.display = "none";

    const fields = {
        _token: $('meta[name="csrf-token"]').attr("content"),
        ...(kelas && { kelas }),
        ...(level && { level }),
        ...(soal  && { soal  }),
    };

    Object.entries(fields).forEach(([name, value]) => {
        const input = document.createElement("input");
        input.type  = "hidden";
        input.name  = name;
        input.value = value;
        form.appendChild(input);
    });

    document.body.appendChild(form);
    form.submit();
    document.body.removeChild(form);
}