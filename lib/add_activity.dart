import 'package:flutter/material.dart';

class AddActivityView extends StatelessWidget {
  final Function(String) onActivityAdded;

  AddActivityView({required this.onActivityAdded});

  @override
  Widget build(BuildContext context) {
    final TextEditingController activityController = TextEditingController();
    return Column(
      children: [
        Text('Add Activity View Content'),
        AlertDialog(
          title: Text('Add Activity'),
          content: TextField(
            controller: activityController,
            decoration: InputDecoration(labelText: 'Activity'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                final activity = activityController.text;
                if (activity.isNotEmpty) {
                  onActivityAdded(activity);
                  Navigator.pop(context);
                }
              },
              child: Text('Add'),
            ),
          ],
        ),
      ],
    );
  }
}
