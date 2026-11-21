import 'package:flutter/material.dart';

import 'mood.dart';

class StreakChip extends StatelessWidget {
  const StreakChip({super.key, required this.hari});

  final int hari;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('🔥 $hari hari berturut-turut mencatat mood'),
      labelStyle: const TextStyle(fontSize: 12, color: warnaUtama),
      backgroundColor: const Color(0xFFE9E4FA),
      side: BorderSide.none,
    );
  }
}
