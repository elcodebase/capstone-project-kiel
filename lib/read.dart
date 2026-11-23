import 'package:material_ui/material_ui.dart';

import 'create.dart';
import 'moodEntry.dart';

import 'moodFace.dart';

class ReadMoodPage extends StatelessWidget {
  const ReadMoodPage({super.key, required this.entry});

  final MoodEntry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perasaanmu - ${entry.mood.label}')),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: MoodFace(mood: entry.mood, size: 100)),
              const SizedBox(height: 16),
              Text(formatTanggal(entry.waktu)),
              const SizedBox(height: 8),
              Text(entry.catatan.isEmpty ? 'Tanpa catatan' : entry.catatan),

              const Spacer(),
              FilledButton(
                onPressed: () => Navigator.push(
                  context,

                  MaterialPageRoute(
                    builder: (_) => CreateMoodPage(entry: entry),
                  ),
                ),
                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Ubah Mood'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
