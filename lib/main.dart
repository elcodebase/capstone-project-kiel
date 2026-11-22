import 'package:material_ui/material_ui.dart';

import 'onboarding.dart';
import 'tema.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: tema,
      builder: (_, mode, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Cheers',

        theme: bangunTema(Brightness.light),
        darkTheme: bangunTema(Brightness.dark),
        themeMode: mode,
        home: const OnboardingPage(),
      ),
    );
  }
}
