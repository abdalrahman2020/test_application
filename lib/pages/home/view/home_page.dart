import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'dart:async';
import 'package:intl/date_symbol_data_local.dart';
import 'package:test_application/pages/calendar/calendar.dart';
import 'package:test_application/pages/home/components/components.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Timer _timer;
  String _currentDateTime = '';
  bool _isEmotionSelected = false;
  bool _isNotesTextFieldEmpty = true;

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

  void _onEmotionSelected(bool isSelected) {
    setState(() {
      _isEmotionSelected = isSelected;
    });
  }

  void _onNotesTextChanged(bool isEmpty) {
    setState(() {
      _isNotesTextFieldEmpty = isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
        centerTitle: true,
        actions: [
          InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CalendarPage()),
                );
              },
              child: const Icon(
                Icons.calendar_month,
                color: Color.fromRGBO(188, 188, 191, 1),
              )),
          const SizedBox(width: 20)
        ],
        title: Text(_currentDateTime,
            style: GoogleFonts.nunito(
              textStyle: const TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 22,
                color: Color.fromRGBO(188, 188, 191, 1),
              ),
            )),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 12),
            RowEmotionList(onEmotionSelected: _onEmotionSelected),
            const SizedBox(height: 20),
            BaseSlider(
                title: 'Уровень стресса',
                firstValue: 'Низкий',
                secondValue: 'Высокий',
                isEmotionSelected: _isEmotionSelected),
            BaseSlider(
                title: 'Самооценка',
                firstValue: 'Неуверенность',
                secondValue: 'Уверенность',
                isEmotionSelected: _isEmotionSelected),
            NotesTextField(onTextChange: _onNotesTextChanged),
            const SizedBox(height: 36),
            SaveButton(isEmotionSelected: _isEmotionSelected, isNotesTextFieldNotEmpty: _isNotesTextFieldEmpty),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
