import 'package:material_ui/material_ui.dart';

import 'moodType.dart';

class MoodFace extends StatelessWidget {
  const MoodFace({super.key, required this.mood, this.size = 44});

  final MoodType mood;
  final double size;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: size / 2, backgroundColor: mood.color);
  }
}
