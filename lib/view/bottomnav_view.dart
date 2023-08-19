import 'package:flutter/material.dart';
import 'package:mano_task/view/counter_view.dart';
import 'package:mano_task/view/home_view.dart';
import 'package:mano_task/view/profile_view.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  List screens = [Home(),Counter(),Profile()];
  int screen = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(onTap: (currIndex){
        setState(() {
          screen = currIndex;
        });
      },
        currentIndex: screen
        ,items: [
        BottomNavigationBarItem(label:'Home' ,icon: Icon(Icons.home)),
        BottomNavigationBarItem(label:'Counter',icon: Icon(Icons.add)),
        BottomNavigationBarItem(label:'Profile',icon: Icon(Icons.face)),
        ],),
      body: screens[screen],
    );
  }
}
