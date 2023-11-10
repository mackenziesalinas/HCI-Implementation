import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

enum ScheduleView { weekly, daily, monthly }

class UserSchedulePage extends StatefulWidget {
  final ScheduleView initialView;

  UserSchedulePage({required this.initialView});

  @override
  _UserSchedulePageState createState() => _UserSchedulePageState();
}

class Activity {
  DateTime date;
  String description;
  DateTime selectedDateTime;

  Activity(this.date, this.description, this.selectedDateTime);
}

class _UserSchedulePageState extends State<UserSchedulePage> {
  late DateTime _selectedDay;
  late CalendarFormat _calendarFormat;
  late ScheduleView _currentView;
  List<Activity> dailyActivities = [];

  String newActivity = '';
  DateTime selectedDateTime = DateTime.now();

  @override
  void initState() {
  super.initState();
  _selectedDay = DateTime.now();
  _currentView = widget.initialView;
  _calendarFormat = _currentView == ScheduleView.weekly
      ? CalendarFormat.week
      : CalendarFormat.month;

  // Initialize dailyActivities with some hardcoded activities
  dailyActivities = [
    Activity(
      DateTime(2023, 11, 11),
      'Meeting with Team A',
      DateTime(2023, 1, 11, 14, 30),
    ),
    Activity(
      DateTime(2023, 11, 09),
      'Presentation',
      DateTime(2023, 1, 11, 10, 15),
    ),
    // Add more activities as needed
  ];
}


  static bool isSameDay(DateTime dayA, DateTime dayB) {
    return dayA.year == dayB.year && dayA.month == dayB.month && dayA.day == dayB.day;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  void _switchView(ScheduleView view) {
    setState(() {
      _currentView = view;
      if (_currentView == ScheduleView.daily) {
        _calendarFormat = CalendarFormat.week;
      } else if (_currentView == ScheduleView.monthly) {
        _calendarFormat = CalendarFormat.month;
      } else {
        _calendarFormat = CalendarFormat.week;
      }
    });
  }

  void _addActivity(Activity activity) {
    setState(() {
      dailyActivities.add(activity);
      newActivity = ''; // Clear the new activity field
    });
  }

  void _showAddActivityDialog(DateTime selectedDate) {
    final TextEditingController descriptionController = TextEditingController();
    DateTime selectedDateTime = DateTime.now();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('ADD ACTIVITY'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Date: ${DateFormat('yyyy-MM-dd').format(selectedDate)}'),
              Row(
                children: [
                  Text('Time: ${DateFormat('HH:mm').format(selectedDateTime)}'),
                  ElevatedButton(
                    onPressed: () {
                      showTimePicker(
                        context: context,
                        initialTime: TimeOfDay.fromDateTime(selectedDateTime),
                      ).then((time) {
                        if (time != null) {
                          setState(() {
                            selectedDateTime = DateTime(
                              selectedDate.year,
                              selectedDate.month,
                              selectedDate.day,
                              time.hour,
                              time.minute,
                            );
                          });
                        }
                      });
                    },
                    child: Text('Change Time'),
                  ),
                ],
              ),
              TextField(
                controller: descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                final String description = descriptionController.text;
                if (description.isNotEmpty) {
                  Activity newActivity = Activity(selectedDate, description, selectedDateTime);
                  _addActivity(newActivity);
                  Navigator.of(context).pop();
                }
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }

@override
Widget build(BuildContext context) {
  return Material(
    child: Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            desaturateColor(const Color.fromARGB(255, 147, 205, 253), 0.5),
            desaturateColor(const Color.fromARGB(255, 144, 161, 255), 0.5),
            desaturateColor(Color.fromARGB(255, 253, 191, 241), 0.5),
            desaturateColor(Color.fromARGB(255, 255, 255, 255), 0.5),
          ],
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Center(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.,
            children: <Widget>[
              Align(
                alignment: Alignment.centerLeft, // Align the button to the left
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Navigate back to the dashboard
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text('RETURN TO DASHBOARD'),
                ),
              ),
              SizedBox(height: 30),
              Text(
                'Your Schedule:',
                style: GoogleFonts.playfairDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.normal,
                  color: Colors.black,
                ),
              ),
            if (_currentView != ScheduleView.weekly)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => _switchView(ScheduleView.weekly),
                      child: Text('Weekly View'),
                    ),
                    ElevatedButton(
                      onPressed: () => _switchView(ScheduleView.daily),
                      child: Text('Daily View'),
                    ),
                    ElevatedButton(
                      onPressed: () => _switchView(ScheduleView.monthly),
                      child: Text('Monthly View'),
                    ),
                  ],
                ),
              ),
            TableCalendar(
              firstDay: DateTime.utc(2023, 1, 1),
              lastDay: DateTime.utc(2023, 12, 31),
              focusedDay: _selectedDay,
              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },
              onPageChanged: (focusedDay) {
                if (_currentView == ScheduleView.weekly) {
                  setState(() {
                    _selectedDay = focusedDay;
                  });
                }
              },
              onDaySelected: (selectedDay, focusedDay) {
                _onDaySelected(selectedDay, focusedDay);
              },
              selectedDayPredicate: (day) => isSameDay(day, _selectedDay),
            ),
            CustomWeeklyView(
              selectedWeek: _selectedDay,
              weeklyActivities: dailyActivities,
              selectedDay: _selectedDay,
              onAddActivity: _addActivity, // Pass the correct function here
              newActivity: newActivity,
              onNewActivityChanged: (activity) {
                setState(() {
                  newActivity = activity;
                });
              },
              onDateSelected: (date) {
                setState(() {
                  selectedDateTime = DateTime(date.year, date.month, date.day, selectedDateTime.hour, selectedDateTime.minute);
                });
              },
              onTimeSelected: (time) {
                setState(() {
                  selectedDateTime = DateTime(selectedDateTime.year, selectedDateTime.month, selectedDateTime.day, time.hour, time.minute);
                });
              },
              selectedDateTime: selectedDateTime,
            ),
          ],
        ),
      ),
    ),
  ), );
}
}
class CustomWeeklyView extends StatelessWidget {
  final DateTime selectedWeek;
  final List<Activity> weeklyActivities;
  final DateTime selectedDay;
  String newActivity;
  final ValueChanged<String> onNewActivityChanged;
  final Function(Activity) onAddActivity;
  final Function(DateTime) onDateSelected;
  final Function(TimeOfDay) onTimeSelected;
  DateTime selectedDateTime;

  CustomWeeklyView({
    required this.selectedWeek,
    required this.weeklyActivities,
    required this.selectedDay,
    required this.onAddActivity,
    required this.newActivity,
    required this.onNewActivityChanged,
    required this.onDateSelected,
    required this.onTimeSelected,
    required this.selectedDateTime,
  });

  @override
  Widget build(BuildContext context) {
    final weeklyActivitiesForSelectedWeek = weeklyActivities.where((activity) {
      return isSameDay(activity.date, selectedWeek);
    }).toList();
    bool isToday = isSameDay(selectedWeek, DateTime.now());

    return Column(
      children: [
        Text(
          isToday ? "Today's Activities:" : 'Your Activities:',
          textAlign: TextAlign.left,
          style: GoogleFonts.roboto(fontSize: 18, fontWeight: FontWeight.normal),
        ),
        Column(
          children: weeklyActivitiesForSelectedWeek
              .map((activity) => ListTile(
                    title: Text(
                      '${activity.description} at ${DateFormat('Hm').format(activity.selectedDateTime)}',
                    ),
                  ))
              .toList(),
        ),
        TextField(
          decoration: InputDecoration(labelText: 'NEW ACTIVITY'),
          onChanged: onNewActivityChanged,
        ),
         SizedBox(height: 20),
         Container(
        child: ElevatedButton(
          onPressed: () {
            if (newActivity.isNotEmpty) {
              final activity = Activity(selectedWeek, newActivity, selectedDateTime);
              onAddActivity(activity);
              newActivity = '';
            }
          },
          style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
          child: Text('ADD ACTIVITY'),
        ),
         ), 
        SizedBox(height: 10),
        Container(
        child: ElevatedButton(
          onPressed: () {
            showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(2023),
              lastDate: DateTime(2023, 12, 31),
            ).then((date) {
              if (date != null) {
                onDateSelected(date);
              }
            });
          },
          style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
          child: Text('SELECT DATE'),
        ),
        ),
        SizedBox(height: 10),
        Container(
        child: ElevatedButton(
          onPressed: () {
            showTimePicker(
              context: context,
              initialTime: TimeOfDay.fromDateTime(selectedDateTime),
            ).then((time) {
              if (time != null) {
                onTimeSelected(time);
              }
            });
          },
          style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    onPrimary: Colors.white,
                    elevation: 30,
                    side: BorderSide(color: Color.fromARGB(255, 0, 5, 9)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
          child: Text('SELECT TIME'),
        ),
        ),
      ],
    );
  }
}
Color desaturateColor(Color color, double saturationFactor) {
  final HSLColor hslColor = HSLColor.fromColor(color);
  final double saturation = hslColor.saturation * saturationFactor;
  return hslColor.withSaturation(saturation).toColor();
}