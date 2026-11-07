# Motor Bike Deal (Dealer Motor Honda)

Aplikasi katalog digital dan simulasi kredit sepeda motor Honda modern yang dirancang untuk memudahkan calon pembeli menjelajahi berbagai model sepeda motor, melihat spesifikasi teknis lengkap, serta menghitung estimasi cicilan kredit secara cepat dan akurat.

Aplikasi ini dapat diakses dan berjalan dengan optimal di berbagai perangkat, mulai dari smartphone (Android & iOS), tablet, hingga peramban web dan desktop.

---

## Fitur Utama

### 1. Katalog Motor Lengkap & Terkini
- Menampilkan seluruh lini sepeda motor resmi Honda dari berbagai kategori:
  - **Matic**: Skuter matik populer seperti BeAT, Vario 125, Vario 160, Genio, Scoopy, PCX 160, ADV 160, hingga Forza.
  - **Sport**: Motor bertenaga seperti CB150R Streetfire, CBR150R, CB150X, CRF150L, dan CBR250RR.
  - **Cub (Bebek)**: Motor tangguh dan hemat seperti Revo, Supra X 125, dan GTR 150.
  - **EV (Motor Listrik)**: Sepeda motor listrik ramah lingkungan Honda EM1 e:.
- Dilengkapi filter kategori yang mudah digunakan dan kolom pencarian cepat untuk menemukan motor impian berdasarkan nama model.

### 2. Galeri Varian Interaktif
- Foto produk beresolusi tinggi yang dapat digeser (slide/swipe) langsung untuk melihat berbagai pilihan varian warna motor.
- Desain minimalis dan bersih tanpa pembungkus yang mengganggu visual produk.

### 3. Informasi Spesifikasi Teknis Rinci
- Tabel spesifikasi terstruktur yang mencakup:
  - Mesin / Motor Penggerak
  - Rangka & Kaki-kaki
  - Dimensi & Bobot
  - Kapasitas Tangki Bahan Bakar / Baterai
  - Kelistrikan & Fitur Keselamatan

### 4. Kalkulator Simulasi Kredit & Angsuran
- Fitur interaktif untuk menghitung estimasi pembayaran kredit motor:
  - Pengaturan persentase Uang Muka (Down Payment / DP) mulai dari minimal 20% hingga 70% menggunakan slider.
  - Pilihan jangka waktu pembiayaan (tenor): 11 bulan, 23 bulan, 29 bulan, dan 35 bulan.
  - Rincian estimasi cicilan per bulan yang dihitung secara transparan dan otomatis.

### 5. Konsultasi Sales via WhatsApp
- Tombol langsung untuk menghubungkan calon pembeli ke sales dealer via aplikasi WhatsApp.
- Secara otomatis menyusun draf pesan konsultasi resmi yang mencakup model motor, harga OTR, nilai DP yang dipilih, serta jangka waktu tenor cicilan.

---

## Tampilan Responsif Multi-Perangkat

Antarmuka aplikasi telah diuji dan dirancang adaptif untuk semua jenis ukuran layar:
- **Smartphone**: Navigasi nyaman dengan satu tangan, pencarian mudah di bagian atas, dan kartu produk dua kolom yang proporsional.
- **Tablet & Desktop**: Tampilan layar lebar dengan bilah pencarian modern di navbar atas, katalog 4 kolom yang luas, serta tata letak split-view (dua kolom) pada halaman detail produk.

---

## Panduan Menjalankan Proyek

Bagi Anda yang ingin menjalankan aplikasi ini di komputer lokal, ikuti langkah mudah berikut:

### Prasyarat
Pastikan komputer Anda telah terpasang:
- [Flutter SDK](https://docs.flutter.dev/get-started/install) (versi 3.29 atau lebih baru)
- Peramban web (seperti Google Chrome) atau emulator Android / perangkat fisik

### Langkah Pemasangan

1. **Salin repositori ke komputer Anda:**
   ```bash
   git clone https://github.com/fauzanabdulhakim/dealermotor.git
   cd dealermotor
   ```

2. **Unduh seluruh paket dan dependensi yang dibutuhkan:**
   ```bash
   flutter pub get
   ```

3. **Jalankan aplikasi:**
   - Untuk menjalankan di peramban web:
     ```bash
     flutter run -d chrome
     ```
   - Untuk menjalankan di perangkat / emulator yang terhubung:
     ```bash
     flutter run
     ```

4. **Menjalankan pengujian otomatis (Unit & Widget Test):**
   ```bash
   flutter test
   ```

---

## Struktur Folder Proyek

Kode aplikasi disusun menggunakan pola arsitektur **Clean Architecture & MVVM (Model-View-ViewModel)** agar rapi dan mudah dikembangkan lebih lanjut:

```text
dealermotor/
├── lib/
│   ├── core/                  # Tema warna, utilitas mata uang Rupiah, dan helper
│   ├── data/                  # Sumber data katalog motor dan implementasi repositori
│   ├── domain/                # Model entitas bisnis murni dan kalkulator simulasi kredit
│   └── presentation/          # Tampilan antarmuka pengguna (Views, ViewModels, Widgets)
│       ├── viewmodels/        # Logika state dan logika bisnis presentasi
│       ├── views/             # Halaman utama (HomeView) dan detail produk (DetailView)
│       └── widgets/           # Komponen UI (Kartu Motor, Carousel Promo, Simulasi Kredit)
└── test/                      # Pengujian otomatis unit test dan widget test (100% lulus)
```

---

## Lisensi & Kontribusi

Proyek ini dikembangkan untuk kebutuhan portofolio dan demonstrasi aplikasi dealer motor Honda multi-platform. Saran, masukan, dan kontribusi perbaikan kode dipersilakan melalui fitur *Issues* dan *Pull Requests*.
