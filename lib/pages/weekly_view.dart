import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class WeeklyView extends StatelessWidget {
  final DateTime selectedDay;
  final Function(DateTime) onDaySelected;

  WeeklyView({required this.selectedDay, required this.onDaySelected});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TableCalendar(
          firstDay: DateTime.utc(2023, 1, 1),
          lastDay: DateTime.utc(2023, 12, 31),
          focusedDay: selectedDay,
          onDaySelected: onDaySelected,
          // Add other calendar properties as needed
        ),
        // Add other widgets and functionality here
      ],
    );
  }
}
