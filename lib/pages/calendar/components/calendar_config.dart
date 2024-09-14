import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class CalendarConfig {
  static CalendarDatePicker2Config getConfig({
    required List<String> monthLabels,
    required List<String> weekDayLabels,
    required List<DateTime?> selectedDates,
  }) {
    return CalendarDatePicker2Config(
      calendarType: CalendarDatePicker2Type.single,
      calendarViewMode: CalendarDatePicker2Mode.scroll,
      hideScrollViewMonthWeekHeader: true,
      selectedDayHighlightColor: const Color.fromRGBO(255, 135, 2, 0.25),
      weekdayLabelTextStyle: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Color.fromRGBO(188, 188, 191, 1),
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      scrollViewMonthYearBuilder: (monthDate) {
        return Padding(
          padding: const EdgeInsets.only(left: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                '${monthDate.year}',
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(188, 188, 191, 1),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              Text(
                monthLabels[monthDate.month - 1],
                style: GoogleFonts.nunito(
                  textStyle: const TextStyle(
                    color: Color.fromRGBO(76, 76, 105, 1),
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        );
      },
      dayBuilder: ({required date, decoration, isDisabled, isSelected, isToday, textStyle}) {
        return isToday ?? false
            ? Container(
                decoration: decoration!.copyWith(
                  color: selectedDates.isEmpty ? const Color.fromRGBO(255, 135, 2, 0.25) : Colors.transparent,
                  border: Border.all(style: BorderStyle.none),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Text(
                        date.day.toString(),
                        style: textStyle,
                      ),
                    ),
                    const Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 3),
                        child: CircleAvatar(
                          radius: 4,
                          backgroundColor: Color.fromRGBO(255, 135, 2, 1),
                        ),
                      ),
                    )
                  ],
                ),
              )
            : Container(
                decoration: decoration,
                child: Center(
                  child: Text(
                    date.day.toString(),
                    style: textStyle,
                  ),
                ),
              );
      },
      weekdayLabelBuilder: ({isScrollViewTopHeader, required weekday}) => const SizedBox(height: 0),
      currentDate: DateTime.now().add(const Duration(hours: 3)),
      daySplashColor: const Color.fromARGB(255, 248, 209, 165),
      firstDayOfWeek: 1,
      controlsHeight: 50,
      controlsTextStyle: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Color.fromRGBO(76, 76, 105, 1),
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      dayTextStyle: GoogleFonts.nunito(
        textStyle: const TextStyle(
          color: Color.fromRGBO(76, 76, 105, 1),
          fontWeight: FontWeight.bold,
          fontSize: 16,
        ),
      ),
      selectedDayTextStyle: GoogleFonts.nunito(
          textStyle: const TextStyle(
        color: Color.fromRGBO(76, 76, 105, 1),
        fontSize: 16,
        fontWeight: FontWeight.w500,
      )),
      disabledDayTextStyle: const TextStyle(
        color: Colors.grey,
      ),
      firstDate: DateTime(DateTime.now().year - 2, DateTime.now().month - 1, DateTime.now().day - 5),
      lastDate: DateTime(DateTime.now().year + 3, DateTime.now().month + 2, DateTime.now().day + 10),
      hideScrollViewTopHeader: true,
    );
  }
}
