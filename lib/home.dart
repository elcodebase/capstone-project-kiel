import 'package:flutter/material.dart';

import 'create.dart';
import 'header.dart';
import 'kartumood.dart';
import 'mood.dart';
import 'streak.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<MoodEntry> _daftarMood = _contohData();

  static List<MoodEntry> _contohData() {
    final hariIni = hanyaTanggal(DateTime.now());
    DateTime waktu(int hariLalu, int jam, int menit) =>
        DateTime(hariIni.year, hariIni.month, hariIni.day - hariLalu, jam, menit);

    return [
      MoodEntry(mood: MoodType.bersemangat, waktu: waktu(0, 14, 20), catatan: 'Dapat kabar baik dari klien'),
      MoodEntry(mood: MoodType.tenang, waktu: waktu(0, 11, 0), catatan: 'Meditasi pagi terasa menenangkan'),
      MoodEntry(mood: MoodType.senang, waktu: waktu(0, 8, 30), catatan: 'Pagi yang cerah dan segar'),
      MoodEntry(mood: MoodType.sedih, waktu: waktu(1, 20, 15), catatan: 'Kangen rumah tiba-tiba'),
      MoodEntry(mood: MoodType.cemas, waktu: waktu(1, 9, 0), catatan: 'Deadline bikin deg-degan'),
    ];
  }

  int get _streak {
    var hari = hanyaTanggal(DateTime.now());
    var jumlah = 0;
    while (_daftarMood.any((e) => hanyaTanggal(e.waktu) == hari)) {
      jumlah++;
      hari = hariSebelum(hari);
    }
    return jumlah;
  }

  String _judulHari(DateTime hari) {
    final hariIni = hanyaTanggal(DateTime.now());
    if (hari == hariIni) return 'Hari Ini';
    if (hari == hariSebelum(hariIni)) return 'Kemarin';
    return formatTanggal(hari);
  }

  Future<void> _tambahMood() async {
    final hasil = await Navigator.of(context).push<MoodEntry>(
      MaterialPageRoute(builder: (_) => const CreateMoodPage()),
    );
    if (hasil == null) return;
    setState(() {
      _daftarMood.add(hasil);
      _daftarMood.sort((a, b) => b.waktu.compareTo(a.waktu));
    });
  }

  @override
  Widget build(BuildContext context) {
    final perHari = <DateTime, List<MoodEntry>>{};
    for (final entry in _daftarMood) {
      perHari.putIfAbsent(hanyaTanggal(entry.waktu), () => []).add(entry);
    }

    return Scaffold(
      backgroundColor: warnaLatar,
      floatingActionButton: FloatingActionButton(
        onPressed: _tambahMood,
        backgroundColor: warnaUtama,
        foregroundColor: Colors.white,
        shape: const CircleBorder(),
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 96),
          children: [
            const Header(nama: 'Zika'),
            const SizedBox(height: 16),
            if (_streak > 0)
              Align(
                alignment: Alignment.centerLeft,
                child: StreakChip(hari: _streak),
              ),
            if (perHari.isEmpty)
              const Padding(
                padding: EdgeInsets.only(top: 80),
                child: Text(
                  'Belum ada catatan mood.\nTekan + untuk menambahkan.',
                  textAlign: TextAlign.center,
                ),
              ),
            for (final kelompok in perHari.entries) ...[
              const SizedBox(height: 12),
              Text(
                _judulHari(kelompok.key),
                style: const TextStyle(fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 8),
              for (final entry in kelompok.value)
                KartuMood(
                  entry: entry,
                  onHapus: () => setState(() => _daftarMood.remove(entry)),
                ),
            ],
          ],
        ),
      ),
    );
  }
}
