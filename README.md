# 📘 Aplikasi Jurnal Mood Sederhana

Program ini adalah aplikasi **berbasis terminal** yang ditulis menggunakan bahasa **Dart**.  
Tujuannya adalah untuk membantu pengguna mencatat suasana hati (mood) harian dan melakukan analisis sederhana terhadap frekuensi mood yang pernah dirasakan.

---

## 👨‍💻 Data Praktikan

| Keterangan | Data |
|-------------|------|
| **Nama** | Defit Bagus Saputra |
| **NIM** | H1D023036 |
| **Shift** | C (Lama) / F (Baru) |

---

## 🧠 Fitur Utama

1. **Tambah Catatan Mood Baru**  
   Pengguna dapat menambahkan entri mood lengkap dengan tanggal otomatis dan catatan singkat harian.

2. **Tampilkan Riwayat Jurnal**  
   Menampilkan seluruh catatan mood yang telah disimpan dalam urutan waktu.

3. **Analisis Frekuensi Mood**  
   Menghitung seberapa sering setiap mood muncul, kemudian menampilkannya dalam urutan dari yang paling sering.

4. **Keluar dari Program**  
   Menutup aplikasi dengan aman.

---

🧩 Penjelasan Kode: Jurnal Mood Sederhana

Berikut penjelasan tiap bagian penting dari program:

1. **Import Library**

      import 'dart:io';

      Digunakan untuk mengakses input dan output dari terminal, seperti stdin (input dari pengguna) dan stdout (output ke layar).

2. **Tipe Data dan Variabel Global**

      typedef Jurnal = List<Map<String, String>>;
      Jurnal jurnalMood = [];


      typedef Jurnal membuat alias tipe data agar lebih mudah dibaca.

      Dalam hal ini, Jurnal berarti daftar (List) yang berisi data dalam bentuk pasangan kunci-nilai (Map<String, String>).

      jurnalMood menyimpan seluruh catatan mood yang sudah dimasukkan.

3. **Fungsi tambahCatatan()**

      void tambahCatatan(String mood, String catatan) {
      String tanggal = DateTime.now().toString().substring(0, 10);
      Map<String, String> entri = {
         'tanggal': tanggal,
         'mood': mood,
         'catatan': catatan,
      };
      jurnalMood.add(entri);
      print("-> Catatan baru ditambahkan: Mood '$mood' pada $tanggal.");
      }

      Fungsi ini digunakan untuk:
      a. Mengambil tanggal hari ini secara otomatis.
      b. Menyimpan data mood dan catatan dalam bentuk map.
      c. Menambahkan map tersebut ke list jurnalMood.
      d. Menampilkan pesan konfirmasi bahwa catatan berhasil ditambahkan.

4. *Fungsi tampilkanHistory()*

      void tampilkanHistory() {
      if (jurnalMood.isEmpty) {
         print("Jurnal masih kosong.");
         return;
      }

      for (var entri in jurnalMood) {
         print("Tanggal: ${entri['tanggal']}");
         print("Mood: ${entri['mood']}");
         print("Catatan: ${entri['catatan']}");
         print("----------------------------------");
      }
      }
      Fungsi ini digunakan untuk:
      a. Mengecek apakah jurnal kosong.
      b. Jika tidak kosong, menampilkan semua entri satu per satu dalam format yang rapi.

5. *Fungsi analisisFrekuensiMood()*

      void analisisFrekuensiMood() {
      if (jurnalMood.isEmpty) {
         print("Belum ada data untuk dianalisis.");
         return;
      }

      Map<String, int> frekuensi = {};
      for (var entri in jurnalMood) {
         String mood = entri['mood']!;
         frekuensi[mood] = (frekuensi[mood] ?? 0) + 1;
      }

      var sortedFrekuensi = frekuensi.entries.toList()
         ..sort((a, b) => b.value.compareTo(a.value));

      for (var entry in sortedFrekuensi) {
         print("Anda merasa '${entry.key}' sebanyak ${entry.value} kali.");
      }
      }

      Fungsi ini digunakan untuk:
      a. Menghitung berapa kali setiap mood muncul.
      b. Menyimpan hasil perhitungan dalam map frekuensi.
      c. Mengurutkan hasil dari yang paling sering ke paling jarang.
      d. Menampilkan hasil analisis di terminal.

6. Fungsi main()

   void main() {
   while (true) {
      print("\n--- MENU ---");
      print("1. Tambah Catatan Mood Baru");
      print("2. Tampilkan Riwayat Jurnal");
      print("3. Analisis Frekuensi Mood");
      print("4. Keluar");
      stdout.write("Pilih opsi (1-4): ");

      String? input = stdin.readLineSync();
      int? choice = int.tryParse(input ?? '');

      switch (choice) {
         case 1: ...; break;
         case 2: ...; break;
         case 3: ...; break;
         case 4:
         print("Terima kasih telah menggunakan Jurnal Mood. Sampai jumpa!");
         return;
         default:
         print("Pilihan tidak valid.");
      }
   }
   }

   Penjelasan:
   a. Program berjalan dalam loop tak hingga (while (true)) agar menu terus muncul sampai pengguna memilih keluar.
   b. Menggunakan stdin.readLineSync() untuk menerima input dari pengguna.
   c. switch digunakan untuk menjalankan fungsi sesuai pilihan menu.
   d. Saat memilih opsi 4, program berhenti dengan return.