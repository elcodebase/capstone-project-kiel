import 'package:material_ui/material_ui.dart';

import 'home.dart';
import 'ilustrasi.dart';
import 'titik.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int _halaman = 0;
  final _judul = ['Kenali Setiap\nPerasaanmu', 'Catat Mood dalam\nHitungan Detik', 'Temukan Pola\n& Pemicunya'];
  final _isi = [
    'Setiap mood yang kamu rasakan itu berharga. Catat, pahami, dan rayakan perjalanan emosimu.',
    'Pilih mood, tambahkan catatan singkat, dan selesai. Secepat itu untuk mengenal dirimu lebih baik.',
    'Lihat tren emosimu dari waktu ke waktu dan pahami apa yang memengaruhi harimu.',
  ];

  void _selesai() {
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => const MyHomePage()));
  }

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 24),
          child: Column(
            children: [
              SizedBox(
                height: 56,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: _halaman < 2
                      ? Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: TextButton(
                            onPressed: _selesai,
                            style: TextButton.styleFrom(foregroundColor: warna.onSurfaceVariant),
                            child: const Text('Lewati'),
                          ),
                        )
                      : null,
                ),
              ),
              Expanded(child: Ilustrasi(halaman: _halaman)),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  children: [
                    ConstrainedBox(
                      constraints: const BoxConstraints(minHeight: 140),
                      child: Column(
                        children: [
                          Text(
                            _judul[_halaman],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: warna.onSurface),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            _isi[_halaman],
                            textAlign: TextAlign.center,
                            style: TextStyle(color: warna.onSurfaceVariant),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                    Titik(aktif: _halaman),
                    const SizedBox(height: 80),
                    FilledButton(
                      onPressed: () {
                        if (_halaman < 2) {
                          setState(() => _halaman++);
                        } else {
                          _selesai();
                        }
                      },
                      style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                      child: Text(_halaman < 2 ? 'Lanjut' : 'Mulai Sekarang'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
