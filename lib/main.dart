import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/select_hobbies_page.dart';
import 'pages/activity_review.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ActivityReview(),

      routes: {
        '/select_hobbies_page': (context) => SelectHobbiesPage(),
      }
    );
  }
}