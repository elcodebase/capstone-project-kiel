import 'package:material_ui/material_ui.dart';

class Label extends StatelessWidget {
  const Label(this.teks, {super.key});

  final String teks;

  @override
  Widget build(BuildContext context) {
    return Text(
      teks,
      style: TextStyle(
        fontSize: 12,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
    );
  }
}
