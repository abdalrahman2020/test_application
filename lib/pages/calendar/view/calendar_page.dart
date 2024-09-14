import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:test_application/pages/calendar/components/components.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<DateTime?> selectedDates = [];
  List<String> weekDayLabels = ['Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб', 'Вс'];
  List<String> monthLabels = [
    'Январь',
    'Февраль',
    'Март',
    'Апрель',
    'Май',
    'Июнь',
    'Июль',
    'Август',
    'Сентябрь',
    'Октябрь',
    'Ноябрь',
    'Декабрь',
  ];
  final PageController _pageController = PageController(viewportFraction: 1.0);
  final DateTime _currentMonth = DateTime.now().add(const Duration(hours: 3));

  @override
  Widget build(BuildContext context) {
    final config = CalendarConfig.getConfig(
      monthLabels: monthLabels,
      weekDayLabels: weekDayLabels,
      selectedDates: selectedDates,
    );
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(255, 253, 252, 1),
        leading: Padding(
          padding: const EdgeInsets.only(left: 5),
          child: IconButton(
            icon: SvgPicture.asset('assets/icons/close.svg', color: const Color.fromRGBO(188, 188, 191, 1)),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              setState(() {
                selectedDates.clear();
              });
              _pageController.jumpToPage(DateTime.now().day);
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
          const SizedBox(width: 10),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RowDaysOfWeek(weekDayLabels: weekDayLabels, config: config),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              scrollDirection: Axis.vertical,
              itemCount: 12,
              itemBuilder: (context, index) {
                return CalendarDatePicker2(
                  config: config,
                  value: selectedDates,
                  onValueChanged: (dates) {
                    setState(() {
                      selectedDates = dates;
                    });
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
