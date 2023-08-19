import 'package:flutter/material.dart';

import 'view/bottomnav_view.dart';
import 'view/counter_view.dart';
import 'view/home_view.dart';
import 'view/login_view.dart';
import 'view/profile_view.dart';
import 'view/signup_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  Login(),
    );
  }
}
