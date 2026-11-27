import 'package:material_ui/material_ui.dart';

import 'onboarding.dart';
import 'tema.dart';

class Nav extends StatelessWidget {
  const Nav({super.key, required this.aktif, required this.onPilih, required this.onTambah});
  final int aktif;
  final ValueChanged<int> onPilih;
  final VoidCallback onTambah;

  void _keluar(BuildContext context) {
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const OnboardingPage()), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    final gelap = Theme.of(context).brightness == Brightness.dark;
    final ikonMode = gelap ? Icons.light_mode_outlined : Icons.dark_mode_outlined;
    final labelMode = gelap ? 'Terang' : 'Gelap';

    void change() { //rubah gelap
      tema.value = gelap ? ThemeMode.light : ThemeMode.dark;
    }

    return BottomAppBar(
      child: Row(
        children: [
          Expanded(
            child: Row(//nav kiri
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _menu(context, Icons.article_outlined, 'Beranda', () => onPilih(0), dipilih: aktif == 0),
                _menu(context, Icons.person_outline, 'Profil', () => onPilih(1), dipilih: aktif == 1),
              ],
            ),
          ),
          IconButton.filled(onPressed: onTambah, icon: const Icon(Icons.add)),//nav untuk add
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _menu(context, ikonMode, labelMode, change),
                _menu(context, Icons.logout, 'Keluar', () => _keluar(context)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _menu(BuildContext context, IconData ikon, String label, VoidCallback onTekan, {bool dipilih = false}) {
    final skema = Theme.of(context).colorScheme;
    final warna = dipilih ? skema.primary : skema.onSurfaceVariant;

    return InkWell(
      onTap: onTekan,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(ikon, color: warna),
          Text(label, style: TextStyle(fontSize: 11, color: warna)),
        ],
      ),
    );
  }
}
