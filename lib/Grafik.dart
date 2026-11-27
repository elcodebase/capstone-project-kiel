import 'package:material_ui/material_ui.dart';
import 'package:fl_chart/fl_chart.dart';

import 'moodEntry.dart';

class Grafik extends StatelessWidget {
  const Grafik({super.key, required this.daftar});

  final List<MoodEntry> daftar;

  @override
  Widget build(BuildContext context) {
    final hariIni = hanyaTanggal(DateTime.now()); //perhitungan
    final minggu = [for (var i = 6; i >= 0; i--) DateTime(hariIni.year, hariIni.month, hariIni.day - i)];

    return SizedBox( height: 180, //a
      child: BarChart(
        BarChartData(
          barGroups: [for (var i = 0; i < 7; i++) _batang(i, minggu[i])],
          titlesData: FlTitlesData(
            topTitles: const AxisTitles(),
            rightTitles: const AxisTitles(),
            leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: true, interval: 1)),
            bottomTitles: AxisTitles(sideTitles: SideTitles(showTitles: true, getTitlesWidget: (x, meta) => Text('${minggu[x.toInt()].day}'))),
          ),
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
        ),
      ),
    );
  }

  BarChartGroupData _batang(int x, DateTime hari) { //bb
    final isi = daftar.reversed.where((e) => hanyaTanggal(e.waktu) == hari).toList();
    final warna = [for (var i = 0; i < isi.length; i++) BarChartRodStackItem(i.toDouble(), i + 1, isi[i].mood.color)];
    return BarChartGroupData(x: x, barRods: [BarChartRodData(toY: isi.length.toDouble(), width: 20, color: Colors.transparent, borderRadius: BorderRadius.circular(4), rodStackItems:  warna)],
    );
  }
}
