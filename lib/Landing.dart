import 'package:material_ui/material_ui.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override//b
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(), //aa
              Container(
                padding: const EdgeInsets.all(40), decoration: BoxDecoration(color: warna.primaryContainer, shape: BoxShape.circle),
                child: SvgPicture.asset('assets/images/landingPageAssets/yellowsmile.svg'), //template
              ),
              const SizedBox(height: 40),
              Text('Cheers', style: GoogleFonts.poppins(fontSize: 40, fontWeight: FontWeight.w700, color: warna.primary)),
              const SizedBox(height: 8),
              Text(
                'Catat, pahami, dan rayakan\nperjalanan emosimu.',
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(fontSize: 16, height: 1.5, color: warna.onSurfaceVariant),
              ),
              const Spacer(), //bb
              FilledButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Login())),
                style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: const Text('Sign In'),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const Login(baru: true))),
                style: OutlinedButton.styleFrom(minimumSize: const Size.fromHeight(48)),
                child: const Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
