import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

final tema = ValueNotifier(ThemeMode.system);

ThemeData bangunTema(Brightness b) {
  final dasar = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF5038BC),
      brightness: b,
    ),
  );
  return dasar.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(dasar.textTheme),
  );
}
