
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState>{
  CounterCubit():super(InitialCounter());

  var price = 0;

  CounterCubit getObj(BuildContext context){
    return  BlocProvider.of(context);
  }

  void getSumFunc(var inputOne, var inputTwo)
  {
    price = inputOne + inputTwo;
    emit(GetSum());
  }


}