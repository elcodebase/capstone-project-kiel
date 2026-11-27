import 'package:material_ui/material_ui.dart';

import 'moodFace.dart';
import 'moodEntry.dart';
import 'create.dart';

class KartuMood extends StatelessWidget {
  const KartuMood({super.key, required this.entry, required this.onUbah, required this.onHapus});

  final MoodEntry entry;
  final ValueChanged<MoodEntry> onUbah;
  final VoidCallback onHapus;

  // Membuka halaman yang sama dengan Tambah Mood, tetapi sudah terisi.
  Future<void> _ubah(BuildContext context) async {
    final hasil = await Navigator.push<MoodEntry>(context, MaterialPageRoute(builder: (_) => CreateMoodPage(entry: entry)));
    if (hasil != null) onUbah(hasil);
  }

  @override
  Widget build(BuildContext context) {
    final catatan = entry.catatan.isEmpty ? 'Tanpa catatan' : entry.catatan;

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      color: Theme.of(context).colorScheme.surface,
      elevation: 4,
      shadowColor: const Color(0x294F38BD),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ListTile(
        onTap: () async {
          final hasil = await Navigator.push<MoodEntry>(context, MaterialPageRoute(builder: (_) => CreateMoodPage(entry: entry, lihat: true)));
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
          onSelected: (pilihan) {
            if (pilihan == 'ubah') {
              _ubah(context);
            } else {
              onHapus();
            }
          },
          itemBuilder: (_) => const [
            PopupMenuItem(value: 'ubah', child: Text('Ubah')),
            PopupMenuItem(value: 'hapus', child: Text('Hapus')),
          ],
        ),
      ),
    );
  }
}
