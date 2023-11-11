import 'package:flutter/material.dart';

class DailyView extends StatelessWidget {
  final DateTime selectedDate;
  final List<String> activities;

  DailyView({required this.selectedDate, required this.activities});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Daily View Content for ${selectedDate.toLocal()}'),
        Expanded(
          child: ListView.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(activities[index]),
              );
            },
          ),
        ),
      ],
    );
  }
}
