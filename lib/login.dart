import 'package:material_ui/material_ui.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key, this.baru = false});

  final bool baru;

  @override
  State<Login> createState() => _halamanLogin();
}

class _halamanLogin extends State<Login> {
  String _nama = '';
  String _email = '';
  String _sandi = '';
  bool _tampil = false;

  void _pesan(String teks) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(teks)));
  }

  void _in() {
    final box = Hive.box('mood');
    final email = _email.trim().toLowerCase();
    final Map akun = box.get('akun') ?? {};

    if (widget.baru && _nama.trim().isEmpty) return _pesan('Nama wajib diisi');
    if (!email.contains('@')) return _pesan('Email tidak valid');
    if (widget.baru && akun.containsKey(email)) return _pesan('Email sudah terdaftar');
    if (!widget.baru && akun[email]?['sandi'] != _sandi) return _pesan('Email atau kata sandi salah');
    if (widget.baru) akun[email] = {'nama': _nama.trim(), 'sandi': _sandi};

    box.putAll({'akun': akun, 'email': email, 'nama': akun[email]['nama']});
    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) => const MyHomePage()), (_) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(), // duh when yah
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              widget.baru ? 'Buat Akun' : 'Masukkan Datamu',
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 24),
            if (widget.baru) ...[
              TextField(
                onChanged: (teks) => _nama = teks,
                textCapitalization: TextCapitalization.words,
                decoration: const InputDecoration(hintText: 'Nama', border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(12)))),
              ),
              const SizedBox(height: 12),
            ],
            TextField(
              onChanged: (teks) => setState(() => _email = teks),
              keyboardType: TextInputType.emailAddress,
              decoration: const InputDecoration(hintText: 'Email', border: OutlineInputBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(12)))),
            ),
            TextField(
              onChanged: (teks) => setState(() => _sandi = teks),
              obscureText: !_tampil,
              decoration: InputDecoration(
                hintText: 'Kata sandi',
                border: const OutlineInputBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(12))),
                suffixIcon: IconButton(icon: Icon(_tampil ? Icons.visibility_off_outlined : Icons.visibility_outlined), onPressed: () => setState(() => _tampil = !_tampil)),
              ),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: _email.isEmpty || _sandi.isEmpty ? null : _in,
              style: FilledButton.styleFrom(minimumSize: const Size.fromHeight(48)),
              child: Text(widget.baru ? 'DAFTAR' : 'MASUK'),
            ),
          ],
        ),
      ),
    );
  }
}
