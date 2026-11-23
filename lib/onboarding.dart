import 'package:material_ui/material_ui.dart';

import 'home.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _halaman = 0;
  final _judul = [
    'Kenali Setiap Perasaanmu',
    'Catat Mood dalam Hitungan Detik',
    'Judul onboarding 3',
  ];
  final _isi = [
    'Catat, pahami, dan rayakan perjalanan emosimu.',
    'Pilih mood, tambahkan catatan singkat, dan selesai.',
    'Isi onboarding 3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Text(
                _judul[_halaman],
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(height: 12),
              Text(_isi[_halaman], textAlign: TextAlign.center),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  if (_halaman < 2) {
                    setState(() => _halaman++);
                  } else {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const MyHomePage()),
                    );
                  }
                },

                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Lanjut'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
