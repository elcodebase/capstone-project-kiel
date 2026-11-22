import 'package:material_ui/material_ui.dart';

import 'tema.dart';

class ProfilPage extends StatelessWidget {
  const ProfilPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profil')),
      body: ValueListenableBuilder(
        valueListenable: tema,
        builder: (_, mode, _) => SwitchListTile(
          title: const Text('Mode gelap'),
          value: mode == ThemeMode.dark,
          onChanged: (v) => tema.value = v ? ThemeMode.dark : ThemeMode.light,
        ),
      ),
    );
  }
}
