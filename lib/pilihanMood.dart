import 'package:flutter/material.dart';

import 'moodFace.dart';
import 'mood.dart';

class PilihanMood extends StatelessWidget {
  const PilihanMood({
    super.key,
    required this.mood,
    required this.dipilih,
    required this.onTap,
  });

  final MoodType mood;
  final bool dipilih;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(14),
      child: Container(
        decoration: BoxDecoration(
          color: dipilih ? mood.color : Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: dipilih ? mood.color : Colors.black12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MoodFace(mood: mood, size: 40),
            const SizedBox(height: 8),
            Text(
              mood.label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: dipilih ? FontWeight.w700 : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
