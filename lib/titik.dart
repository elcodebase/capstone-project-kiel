import 'package:material_ui/material_ui.dart';

class Titik extends StatelessWidget {
  const Titik({super.key, required this.aktif, this.jumlah = 3});

  final int aktif;
  final int jumlah;

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < jumlah; i++)
          Container(
            width: i == aktif ? 24 : 8,
            height: 8,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            decoration: BoxDecoration(
              color: i == aktif ? warna.primary : warna.outlineVariant,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
      ],
    );
  }
}
