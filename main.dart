import 'dart:io';

typedef Jurnal = List<Map<String, String>>;

Jurnal jurnalMood = [];

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

void tampilkanHistory() {
  print("\n--- 📖 RIWAYAT JURNAL MOOD 📖 ---");

  if (jurnalMood.isEmpty) {
    print("Jurnal masih kosong. Mulailah mencatat mood Anda!");
    return;
  }

  for (var entri in jurnalMood) {
    print("Tanggal: ${entri['tanggal']}");
    print("Mood: ${entri['mood']}");
    print("Catatan: ${entri['catatan']}");
    print("----------------------------------");
  }
}

void analisisFrekuensiMood() {
  print("\n--- 📊 ANALISIS FREKUENSI MOOD 📊 ---");

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

void main() {
  print("Selamat datang di Aplikasi Jurnal Mood Sederhana.");

  while (true) {
    print("\n--- MENU ---");
    print("1. Tambah Catatan Mood Baru");
    print("2. Tampilkan Riwayat Jurnal");
    print("3. Analisis Frekuensi Mood");
    print("4. Keluar");
    stdout.write("Pilih opsi (1-4): ");

    String? input = stdin.readLineSync();
    int? choice = int.tryParse(input ?? '');

    if (choice == null) {
      print("Input tidak valid. Harap masukkan angka.");
      continue;
    }

    switch (choice) {
      case 1:
        stdout.write("Masukkan mood Anda (e.g., Senang, Sedih, Tenang): ");
        String? moodInput = stdin.readLineSync();
        if (moodInput == null || moodInput.trim().isEmpty) {
          print("Mood tidak boleh kosong. Pembatalan.");
          break;
        }

        stdout.write("Masukkan catatan Anda hari ini: ");
        String? catatanInput = stdin.readLineSync();
        if (catatanInput == null || catatanInput.trim().isEmpty) {
          print("Catatan tidak boleh kosong. Pembatalan.");
          break;
        }
        tambahCatatan(moodInput.trim(), catatanInput.trim());
        break;
      case 2:
        tampilkanHistory();
        break;
      case 3:
        analisisFrekuensiMood();
        break;
      case 4:
        print("Terima kasih telah menggunakan Jurnal Mood. Sampai jumpa!");
        return; // Exit the program
      default:
        print("Pilihan tidak valid. Silakan pilih antara 1 dan 4.");
    }
  }
}