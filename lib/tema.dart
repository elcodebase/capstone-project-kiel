import 'package:material_ui/material_ui.dart';
import 'package:google_fonts/google_fonts.dart';

final tema = ValueNotifier(ThemeMode.light);

ThemeData bangunTema(Brightness b) {
  // Token warna dari Figma. Nilai null berarti warna otomatis (mode gelap).
  final terang = b == Brightness.light;
  final dasar = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF5038BC),
      brightness: b,
      primary: terang ? const Color(0xFF5038BC) : null,
      primaryContainer: terang ? const Color(0xFFE4DEF7) : null,
      onPrimaryContainer: terang ? const Color(0xFF5038BC) : null,
      surface: terang ? Colors.white : null,
      surfaceContainerLowest: terang ? const Color(0xFFF9FAFB) : null,
      onSurface: terang ? const Color(0xFF111827) : null,
      onSurfaceVariant: terang ? const Color(0xFF6B7280) : null,
      outline: terang ? const Color(0xFFE5E7EB) : null,
    ),
  );
  final warna = dasar.colorScheme;
  return dasar.copyWith(
    textTheme: GoogleFonts.poppinsTextTheme(dasar.textTheme),
    appBarTheme: AppBarThemeData(
      backgroundColor: warna.surface,
      foregroundColor: warna.onSurface,
      centerTitle: true,
      scrolledUnderElevation: 0,
      titleTextStyle: GoogleFonts.poppinsTextTheme(dasar.textTheme).titleMedium?.copyWith(fontSize: 18, fontWeight: FontWeight.w600, color: warna.onSurface),
    ),
    bottomAppBarTheme: BottomAppBarThemeData(color: warna.surface),
  );
}
