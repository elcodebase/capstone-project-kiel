import 'package:material_ui/material_ui.dart';

import 'moodFace.dart';
import 'moodEntry.dart';
import 'read.dart';

class KartuMood extends StatelessWidget {
  const KartuMood({super.key, required this.entry, required this.onUbah, required this.onHapus});

  final MoodEntry entry;
  final ValueChanged<MoodEntry> onUbah;
  final VoidCallback onHapus;

  @override
  Widget build(BuildContext context) {
    final catatan = entry.catatan.isEmpty ? 'Tanpa catatan' : entry.catatan;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
      child: ListTile(
        onTap: () async {
          final hasil = await Navigator.push<MoodEntry>(context, MaterialPageRoute(builder: (_) => ReadMoodPage(entry: entry)));
          if (hasil != null) onUbah(hasil);
        },
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
