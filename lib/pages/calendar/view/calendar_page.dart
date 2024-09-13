import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  final CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/close.svg', color: const Color.fromRGBO(188, 188, 191, 1)),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                _focusedDay = DateTime.now();
                _selectedDay = DateTime.now();
              });
            },
            child: Text(
              'Сегодня',
              style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                color: Color.fromRGBO(188, 188, 191, 1),
                fontSize: 22,
                fontWeight: FontWeight.w600,
              )),
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: TableCalendar(
              headerVisible: true,
              daysOfWeekVisible: true,
              pageJumpingEnabled: false,
              pageAnimationEnabled: true,
              sixWeekMonthsEnforced: false,
              shouldFillViewport: false,
              weekNumbersVisible: false,
              locale: 'ru_RU',
              firstDay: DateTime.utc(2020, 1, 1),
              lastDay: DateTime.utc(2030, 12, 31),
              focusedDay: _focusedDay,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });
              },
              calendarFormat: CalendarFormat.month,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              calendarStyle: CalendarStyle(
                selectedTextStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(76, 76, 105, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                defaultTextStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(76, 76, 105, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                todayTextStyle: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(76, 76, 105, 1),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                todayDecoration: const BoxDecoration(
                  color: Color.fromRGBO(255, 135, 2, 0.25),
                  shape: BoxShape.circle,
                ),
                selectedDecoration: const BoxDecoration(
                  color: Color.fromRGBO(242, 28, 28, 0.235),
                  shape: BoxShape.circle,
                ),
                outsideDaysVisible: false,
                outsideDecoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
              ),
              startingDayOfWeek: StartingDayOfWeek.monday,
              daysOfWeekStyle: DaysOfWeekStyle(
                weekendStyle: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  color: Color.fromRGBO(188, 188, 191, 1),
                  fontWeight: FontWeight.w600,
                )),
                weekdayStyle: GoogleFonts.nunito(
                    textStyle: const TextStyle(
                  color: Color.fromRGBO(188, 188, 191, 1),
                  fontWeight: FontWeight.w600,
                )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
