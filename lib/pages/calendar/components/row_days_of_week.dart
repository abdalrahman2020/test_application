import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';

class RowDaysOfWeek extends StatelessWidget {
  const RowDaysOfWeek({
    super.key,
    required this.weekDayLabels,
    required this.config,
  });

  final List<String> weekDayLabels;
  final CalendarDatePicker2Config config;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(7, (index) {
          return Expanded(
            child: Center(
              child: Text(
                weekDayLabels[index],
                style: config.weekdayLabelTextStyle,
              ),
            ),
          );
        }),
      ),
    );
  }
}
