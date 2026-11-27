import 'package:material_ui/material_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'moodEntry.dart';
import 'moodType.dart';
import 'Grafik.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;
    final box = Hive.box('mood');
    final String email = box.get('email') ?? '-';
    final String nama = box.get('nama') ?? 'Teman';
    final daftar = [for (final item in box.get('daftar_$email') ?? []) MoodEntry.fromMap(item)];
    final tanggal = daftar.map((e) => hanyaTanggal(e.waktu)).toSet();
    final hariIni = hanyaTanggal(DateTime.now());
    var streak = 0;
    while (tanggal.contains(DateTime(hariIni.year, hariIni.month, hariIni.day - streak))) {
      streak++;
    }
    var favorit = '-';
    var terbanyak = 0;
    for (final mood in MoodType.values) {
      final jumlah = daftar.where((e) => e.mood == mood).length;
      if (jumlah > terbanyak) {
        terbanyak = jumlah;
        favorit = mood.label;
      } else if (jumlah > 0 && jumlah == terbanyak) {
        favorit = 'Seimbang';
      }
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ListView(
        children: [
          Container(
            color: warna.primaryContainer,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 48,
                  backgroundColor: warna.primary,
                  foregroundColor: warna.onPrimary,
                  child: Text(nama.characters.first.toUpperCase(), style: const TextStyle(fontSize: 36)),
                ),
                const SizedBox(height: 12),
                Text(nama, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
                Text(email, style: TextStyle(color: warna.onSurfaceVariant)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _angka('${daftar.length}', 'Catatan'),
                    _angka('${tanggal.length}', 'Hari aktif'),
                    _angka('${daftar.where((e) => hanyaTanggal(e.waktu) == hariIni).length}', 'Hari ini'),
                  ],
                ),
                const Divider(height: 32),
                const Text('RINGKASAN', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 12),
                Row(children: [_angka('🔥 $streak hari', 'Beruntun'), _angka(favorit, favorit == 'Seimbang' ? 'Mood swing' : 'Mood terbanyak')]),
                const Divider(height: 32),
                const Text('MOOD MINGGUAN', style: TextStyle(fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                daftar.isEmpty ? Text('Belum ada catatan mood.', style: TextStyle(color: warna.onSurfaceVariant)) : Grafik(daftar: daftar),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _angka(String nilai, String label) => Expanded(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(nilai, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        Text(label, style: const TextStyle(fontSize: 12)),
      ],
    ),
  );
}
