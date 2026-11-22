import 'package:material_ui/material_ui.dart';

enum MoodType {
  senang('Senang', Color(0xFFFFB933)),
  sedih('Sedih', Color(0xFF5B9DF0)),
  marah('Marah', Color(0xFFFF6B5B)),
  tenang('Tenang', Color(0xFF4DC9B8)),
  cemas('Cemas', Color(0xFFA98BE8)),
  bersemangat('Bersemangat', Color(0xFFFF7EB6));

  const MoodType(this.label, this.color);

  final String label;
  final Color color;
}
