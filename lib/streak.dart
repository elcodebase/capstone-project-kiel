import 'package:material_ui/material_ui.dart';

class StreakChip extends StatelessWidget {
  const StreakChip({super.key, required this.hari});

  final int hari;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text('🔥 $hari hari berturut-turut mencatat mood'),
      labelStyle: TextStyle(
        fontSize: 12,
        color: Theme.of(context).colorScheme.onPrimaryContainer,
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      side: BorderSide.none,
    );
  }
}
