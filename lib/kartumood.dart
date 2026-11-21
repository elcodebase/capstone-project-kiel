import 'package:flutter/material.dart';

import 'moodFace.dart';
import 'mood.dart';

class KartuMood extends StatelessWidget {
  const KartuMood({super.key, required this.entry, required this.onHapus});

  final MoodEntry entry;
  final VoidCallback onHapus;

  @override
  Widget build(BuildContext context) {
    final catatan = entry.catatan.isEmpty ? 'Tanpa catatan' : entry.catatan;

    return Card(
      color: Colors.white,
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        leading: MoodFace(mood: entry.mood),
        title: Text(
          entry.mood.label,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Text(
          '${formatWaktu(entry.waktu)} · $catatan',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: PopupMenuButton<String>(
          onSelected: (_) => onHapus(),
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'hapus', child: Text('Hapus')),
          ],
        ),
      ),
    );
  }
}
