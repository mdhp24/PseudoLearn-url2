/**
 * Playwright E2E Automation Test Script for Drag & Drop UI & Log Tracking
 * File: tests/Frontend/ujianKodeDragDrop.test.js
 */

const { test, expect } = require('@playwright/test');

test.describe('Ujian Kode Drag & Drop UI & Logging Verification', () => {
    test.beforeEach(async ({ page }) => {
        // Login sebagai mahasiswa
        await page.goto('/login');
        await page.fill('#email', 'testing@pseudolearn.com');
        await page.fill('#password', 'password123');
        await page.click('button[type="submit"]');

        // Buka halaman ujian kode konversi
        await page.goto('/ujian-kode?id=01996525-5cf1-7256-8f2f-184909a171ff');
    });

    test('Scenario 1: Penempatan Salah -> Hanya Slot Tersebut Berwarna Merah', async ({ page }) => {
        const wrongBlock = page.locator('.drag-item:has-text("int harga_akhir;")');
        const targetSlot = page.locator('.answer-box.box-java[data-index="4"]'); // Seharusnya float persentase_pajak;

        await wrongBlock.dragTo(targetSlot);
        await page.click('#btn-cek-jawaban');

        // Slot 4 harus mendapat class mismatch/is-incorrect dan border merah
        await expect(targetSlot).toHaveClass(/is-incorrect/);
        await expect(targetSlot).toHaveCSS('border-color', 'rgb(239, 68, 68)');
    });

    test('Scenario 2: Koreksi Jawaban -> Class Merah Langsung Reset ke Default', async ({ page }) => {
        const wrongBlock = page.locator('.drag-item:has-text("int harga_akhir;")');
        const correctBlock = page.locator('.drag-item:has-text("float persentase_pajak;")');
        const targetSlot = page.locator('.answer-box.box-java[data-index="4"]');

        // Drop salah
        await wrongBlock.dragTo(targetSlot);
        await page.click('#btn-cek-jawaban');
        await expect(targetSlot).toHaveClass(/is-incorrect/);

        // Koreksi dengan balok benar
        await correctBlock.dragTo(targetSlot);

        // Class error harus hilang secara reaktif
        await expect(targetSlot).not.toHaveClass(/is-incorrect/);
    });

    test('Scenario 3: Penempatan Benar dari Awal -> Tidak Ada Trigger Merah', async ({ page }) => {
        const correctBlock = page.locator('.drag-item:has-text("float persentase_pajak;")');
        const targetSlot = page.locator('.answer-box.box-java[data-index="4"]');

        await correctBlock.dragTo(targetSlot);
        await expect(targetSlot).not.toHaveClass(/is-incorrect/);
    });

    test('Scenario 4: Clue Slot -> Tidak Mengalami Glitch Warna', async ({ page }) => {
        const clueSlot = page.locator('.answer-box.box-java.has-clue');
        await expect(clueSlot).not.toHaveClass(/is-incorrect/);

        // Lakukan drop acak di slot lain
        const wrongBlock = page.locator('.drag-item').first();
        const emptySlot = page.locator('.answer-box.box-java:not(.has-clue)').first();
        await wrongBlock.dragTo(emptySlot);

        await expect(clueSlot).not.toHaveClass(/is-incorrect/);
    });

    test('Scenario 5: Double-Click OK Modal -> Bebas Backdrop Abu-abu', async ({ page }) => {
        await page.click('#btn-cek-jawaban');

        const okBtn = page.locator('#modal-feedback-incorrect-konversi .btn-primary');
        await okBtn.click({ clickCount: 2, delay: 100 });

        // Verifikasi tidak ada backdrop abu-abu yang tertinggal
        const backdrop = page.locator('.modal-backdrop');
        await expect(backdrop).toHaveCount(0);
        await expect(page.locator('body')).not.toHaveClass(/modal-open/);
    });
});
