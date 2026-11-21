import 'package:flutter/material.dart';

const Color warnaUtama = Color(0xFF4F37B8);
const Color warnaLatar = Color(0xFFF8F7FC);

enum MoodType {
  senang('Senang', Color(0xFFFFB933)),
  sedih('Sedih', Color(0xFF5B9DF0)),
  marah('Marah', Color(0xFFFF6B5B)),
  tenang('Tenang', Color(0xFF4DC9B8)),
  cemas('Cemas', Color(0xFFA98BE8)),
  bersemangat('Bersemangat', Color(0xFFFF7EB6));

  const MoodType(this.label, this.color);

  final String label;
  final Color color;
}

class MoodEntry {
  const MoodEntry({required this.mood, required this.waktu, this.catatan = ''});

  final MoodType mood;
  final DateTime waktu;
  final String catatan;
}

DateTime hanyaTanggal(DateTime d) => DateTime(d.year, d.month, d.day);

DateTime hariSebelum(DateTime d) => DateTime(d.year, d.month, d.day - 1);

const List<String> _namaBulan = ['Januari', 'Februari', 'Maret', 'April', 'Mei', 'Juni', 'Juli', 'Agustus', 'September', 'Oktober', 'November', 'Desember'];

String formatTanggal(DateTime d) =>
    '${d.day} ${_namaBulan[d.month - 1]} ${d.year}';

String formatWaktu(DateTime d) {
  final jam = d.hour.toString().padLeft(2, '0');
  final menit = d.minute.toString().padLeft(2, '0');
  return '$jam:$menit';
}
