import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano_task/bloc/bottom_nav_cubit/bottom_nav_cubit.dart';
import 'package:mano_task/bloc/bottom_nav_cubit/bottom_van_state.dart';
import 'package:mano_task/view/profile_view.dart';
import 'package:mano_task/view/test.dart';
import 'home_view.dart';

class BottomNavStateless extends StatelessWidget {
  BottomNavStateless({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var obj = BottomNavCubit().getObj(context);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(onTap: (currIndex){
        obj.getCurrIndexFunc(currIndex);
        print(obj.screen);
      },
        currentIndex: obj.screen
        ,items: [
          BottomNavigationBarItem(label:'Home' ,icon: Icon(Icons.home)),
          BottomNavigationBarItem(label:'Counter',icon: Icon(Icons.add)),
          BottomNavigationBarItem(label:'Profile',icon: Icon(Icons.face)),
        ],),

      body: BlocBuilder<BottomNavCubit,BottomNavState>(builder:(context,state){
        if(state is InitialBottomNav)
          {
            return obj.screens[obj.screen];
          }
        else{
          return obj.screens[obj.screen];
        }
      }),

    );
  }
}
