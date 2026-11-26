import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'moodType.dart';

class MoodFace extends StatelessWidget {
  const MoodFace({super.key, required this.mood, this.size = 44});

  final MoodType mood;
  final double size;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/images/landingPageAssets/${mood.name}.svg', width: size, height: size);
  }
}
