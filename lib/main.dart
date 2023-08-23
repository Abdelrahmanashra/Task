import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano_task/view/bottomnav_stateless_view.dart';
import 'package:mano_task/view/test.dart';

import 'bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'bloc/counter_cubit/counter_logic.dart';
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
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context)=>CounterCubit()),
      BlocProvider(
          create: (context)=>BottomNavCubit()),


    ],
    child: MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  Profile(),
    ));
  }
}
