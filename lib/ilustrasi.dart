import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'moodFace.dart';
import 'moodType.dart';

const _folder = 'assets/images/landingPageAssets';

// Posisi mengikuti frame Figma 390 x 844, bagian ilustrasi mulai dari y = 100.
class Ilustrasi extends StatelessWidget {
  const Ilustrasi({super.key, required this.halaman});

  final int halaman;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: SizedBox(
        width: 390,
        height: 400,
        child: Stack(
          children: switch (halaman) {
            0 => [_gambar('pinkcircle', -60, 0), _gambar('greycircle', 207, 173), _gambar('yellowsmile', 131, 116)],
            1 => [
              _lingkaran(MoodType.senang, 250, 10, 200),
              _lingkaran(MoodType.sedih, -50, 220, 160),
              _wajah(MoodType.tenang, 74, 85, 88),
              _wajah(MoodType.senang, 211, 56, 88),
              _wajah(MoodType.sedih, 84, 196, 88),
              _wajah(MoodType.bersemangat, 205, 224, 88),
            ],
            _ => [
              _lingkaran(MoodType.cemas, -70, 40, 200),
              _lingkaran(MoodType.marah, 279, 230, 170),
              _wajah(MoodType.senang, 66, 63, 64),
              _wajah(MoodType.sedih, 162, 38, 64),
              _wajah(MoodType.marah, 248, 67, 64),
              _wajah(MoodType.tenang, 72, 157, 64),
              _wajah(MoodType.cemas, 157, 188, 64),
              _wajah(MoodType.bersemangat, 253, 156, 64),
            ],
          },
        ),
      ),
    );
  }

  Widget _gambar(String nama, double x, double y) =>
      Positioned(left: x, top: y, child: SvgPicture.asset('$_folder/$nama.svg'));

  Widget _lingkaran(MoodType mood, double x, double y, double ukuran) => Positioned(
    left: x,
    top: y,
    child: CircleAvatar(radius: ukuran / 2, backgroundColor: mood.color),
  );

  Widget _wajah(MoodType mood, double x, double y, double ukuran) => Positioned(
    left: x,
    top: y,
    child: MoodFace(mood: mood, size: ukuran),
  );
}
