import 'package:material_ui/material_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'onboarding.dart';
import 'tema.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox('mood');
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
