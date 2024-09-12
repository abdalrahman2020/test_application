import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart';

import 'package:test_application/pages/home/components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  String _currentDateTime = '';

  void _updateDateTime() {
    setState(() {
      _currentDateTime = DateFormat('d MMMM HH:mm', 'ru').format(DateTime.now().toUtc().add(const Duration(hours: 3)));
    });
  }

  @override
  void initState() {
    super.initState();
    initializeDateFormatting('ru', null).then((_) {
      _updateDateTime();
      _timer = Timer.periodic(const Duration(minutes: 1), (Timer t) => _updateDateTime());
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
      appBar: AppBar(
        centerTitle: true,
        actions: [InkWell(onTap: () {}, child: const Icon(Icons.calendar_month)), const SizedBox(width: 20)],
        title: Text(_currentDateTime),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            const ToggleButtonHeading(),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                'Что чувствуешь?',
                style: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                  color: Color.fromRGBO(35, 35, 43, 1),
                )),
              ),
            ),
            const SizedBox(height: 20),
            const RowEmotionList(),
            const SizedBox(height: 24),
            const BaseSlider(title: 'Уровень стресса', firstValue: 'Низкий', secondValue: 'Высокий'),
            const BaseSlider(title: 'Самооценка', firstValue: 'Неуверенность', secondValue: 'Уверенность'),
            const NotesTextField(),
            const SizedBox(height: 36),
            const SaveButton(),
            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }
}
