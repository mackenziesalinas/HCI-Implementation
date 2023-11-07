import 'package:flutter/material.dart';
import 'package:tech_addict/dashboard_page.dart';
import 'package:tech_addict/get_to_know_you_page.dart';
import 'package:tech_addict/user_schedule_page.dart';
import 'package:tech_addict/what_is_your_goal_page.dart';
import 'activity_begin_page.dart';
import 'activity_timer_page.dart';
import 'finished_activity_page.dart';
import 'WelcomePage.dart';
import 'login_page.dart';
import 'select_hobbies_page.dart';
import 'sign_up_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/welcome', // Set the initial route to '/welcome'
      routes: {
        '/login': (context) => LoginPage(),
        '/select_hobbies_page': (context) => SelectHobbiesPage(),
        '/activity_begin': (context) => ActivityBeginPage(),
        '/activity_timer': (context) => ActivityTimerPage(),
        '/finished_activity': (context) => FinishedActivityPage(),
        '/sign_up_page': (context) => SignUpPage(),
        '/get_to_know_you_page': (context) => GetToKnowYouPage(),
        '/welcome': (context) => WelcomePage(),
        '/user_schedule_page': (context) => UserSchedulePage(initialView: ScheduleView.weekly,),
        '/what_is_your_goal_page':(context) => WhatIsYourGoalPage(),
        //'/dashboard_page': (context) => DashboardPage(selectedHobbies),
      },
    );
  }
}

