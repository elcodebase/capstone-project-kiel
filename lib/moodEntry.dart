import 'moodType.dart';

class MoodEntry {
  const MoodEntry({required this.mood, required this.waktu, this.catatan = ''});

  final MoodType mood;
  final DateTime waktu;
  final String catatan;
}

DateTime hanyaTanggal(DateTime d) => DateTime(d.year, d.month, d.day);

DateTime hariSebelum(DateTime d) => DateTime(d.year, d.month, d.day - 1);

const List<String> _namaBulan = [
  'Januari',
  'Februari',
  'Maret',
  'April',
  'Mei',
  'Juni',
  'Juli',
  'Agustus',
  'September',
  'Oktober',
  'November',
  'Desember',
];

String formatTanggal(DateTime d) =>
    '${d.day} ${_namaBulan[d.month - 1]} ${d.year}';

String formatWaktu(DateTime d) {
  final jam = d.hour.toString().padLeft(2, '0');
  final menit = d.minute.toString().padLeft(2, '0');
  return '$jam:$menit';
}
