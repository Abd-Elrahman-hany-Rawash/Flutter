import 'package:attendance_system_app/screens/Doctor/Doctor_Cources_Page.dart';
import 'package:attendance_system_app/screens/Student/add_new_course_Student.dart';
import 'package:attendance_system_app/screens/Student/history_lectuers.dart';
import 'package:attendance_system_app/screens/Doctor/sign_in_Doctor_page.dart';
import 'package:attendance_system_app/screens/Student/sign_in_Student_page.dart';
import 'package:attendance_system_app/screens/intro/intro.dart';
import 'package:attendance_system_app/screens/splashScreen.dart';
import 'package:attendance_system_app/screens/start_page.dart';
import 'package:attendance_system_app/screens/Student/student_Cources_page.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        // '/': (context) => HomePage(),
        '/': (context) => const splash(),
        'student': (context) => const Sign_In_Student(),
        'Doctor': (context) => Sign_In_Doctor(),
        "StudentCources": (context) => StudentCources(),
        "History": (context) => const HistoryPage(),
        "DoctorCources": (context) => DoctorCources(),
        "NewStudentCourse": (context) => const NewStudentCourse()
      },
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
