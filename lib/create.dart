import 'package:material_ui/material_ui.dart';

import 'label.dart';
import 'moodEntry.dart';
import 'pilihanMood.dart';
import 'moodType.dart';

const _border = OutlineInputBorder(
  borderRadius: BorderRadius.all(Radius.circular(10)),
);

class CreateMoodPage extends StatefulWidget {
  const CreateMoodPage({super.key});

  @override
  State<CreateMoodPage> createState() => _CreateMoodPageState();
}

class _CreateMoodPageState extends State<CreateMoodPage> {
  final _catatanController = TextEditingController();
  DateTime _tanggal = hanyaTanggal(DateTime.now());
  MoodType _moodDipilih = MoodType.senang;

  @override
  void dispose() {
    _catatanController.dispose();
    super.dispose();
  }

  String get _labelTanggal {
    final teks = formatTanggal(_tanggal);
    return _tanggal == hanyaTanggal(DateTime.now()) ? 'Hari ini, $teks' : teks;
  }

  Future<void> _pilihTanggal() async {
    final hariIni = hanyaTanggal(DateTime.now());
    final hasil = await showDatePicker(
      context: context,
      initialDate: _tanggal,
      firstDate: DateTime(hariIni.year - 5),
      lastDate: hariIni,
    );
    if (hasil != null) setState(() => _tanggal = hasil);
  }

  void _simpan() {
    final sekarang = DateTime.now();
    final waktu = _tanggal.add(
      Duration(hours: sekarang.hour, minutes: sekarang.minute),
    );
    Navigator.of(context).pop(
      MoodEntry(
        mood: _moodDipilih,
        waktu: waktu,
        catatan: _catatanController.text.trim(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,

        title: const Text(
          'Tambah Mood',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Label('Tanggal'),
                      const SizedBox(height: 8),
                      InkWell(
                        onTap: _pilihTanggal,
                        child: InputDecorator(
                          decoration: const InputDecoration(
                            border: _border,
                            prefixIcon: Icon(Icons.calendar_today_outlined),
                            suffixIcon: Icon(Icons.keyboard_arrow_down),
                          ),
                          child: Text(_labelTanggal),
                        ),
                      ),
                      const SizedBox(height: 24),

                      const Label('Bagaimana perasaanmu?'),
                      const SizedBox(height: 12),

                      GridView.count(
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 12,
                        crossAxisSpacing: 12,
                        children: [
                          for (final mood in MoodType.values)
                            PilihanMood(
                              mood: mood,
                              dipilih: mood == _moodDipilih,
                              onTap: () => setState(() => _moodDipilih = mood),
                            ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Label('Catatan (opsional)'),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _catatanController,
                        minLines: 5,
                        maxLines: 5,
                        decoration: const InputDecoration(
                          hintText: 'Tulis catatanmu di sini...',
                          border: _border,
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 12),
              FilledButton(
                onPressed: _simpan,

                style: FilledButton.styleFrom(
                  minimumSize: const Size.fromHeight(48),
                ),
                child: const Text('Simpan Mood'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
