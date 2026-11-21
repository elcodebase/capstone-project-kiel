import 'package:flutter/material.dart';

class Label extends StatelessWidget {
  const Label(this.teks, {super.key});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: const TextStyle(fontSize: 12, color: Colors.black54),
    );
  }
}
