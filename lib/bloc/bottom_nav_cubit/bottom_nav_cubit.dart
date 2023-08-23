
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../view/home_view.dart';
import '../../view/profile_view.dart';
import '../../view/test.dart';
import 'bottom_van_state.dart';


class BottomNavCubit extends Cubit<BottomNavState>{
  BottomNavCubit():super(InitialBottomNav());

  int screen = 0;
  List screens = [Home(),Test(),Profile()];

  BottomNavCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  void getCurrIndexFunc(int currScreen)
  {
    screen = currScreen;
    emit(ChangeIndexBottomNav());
  }


}