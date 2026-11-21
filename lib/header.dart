import 'package:flutter/material.dart';

import 'mood.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.nama});

  final String nama;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Halo, $nama 👋',
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const Text(
                'Bagaimana perasaanmu hari ini?',
                style: TextStyle(color: Colors.black54),
              ),
            ],
          ),
        ),
        CircleAvatar(
          backgroundColor: const Color(0xFFE4DEF7),
          child: Text(nama[0], style: const TextStyle(color: warnaUtama)),
        ),
      ],
    );
  }
}
