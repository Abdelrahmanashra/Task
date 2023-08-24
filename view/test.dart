import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mano_task/bloc/counter_cubit/counter_logic.dart';
import 'package:mano_task/bloc/counter_cubit/counter_state.dart';

import '../shared/custom_text_field.dart';

class Test extends StatelessWidget {
  const Test({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate=GlobalKey<FormState>();
    TextEditingController inputOneController=TextEditingController();
    TextEditingController inputTwoController=TextEditingController();

    var price = 0;
    var obj = CounterCubit().getObj(context);
    return Scaffold(
        appBar: AppBar(title: Text('Counter stateless',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),) ,centerTitle: true,backgroundColor: Colors.blueAccent,),
        body: Container(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<CounterCubit,CounterState>(builder: (context,state){
                if (state is GetSum)
                  {
                    return Text('Sum = ${obj.price}');
                  }
                else
                  {
                    return Text('Sum = ${obj.price}');
                  }
              },),

              Form(
                  key: formstate,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        customTextFiled(obscureText: false, textInputType: TextInputType.number, hintText:'Input one', label: Text('Input One'), textcontroller: inputOneController),
                        customTextFiled(obscureText: false, textInputType: TextInputType.number, hintText:'Input Two', label: Text('Input Two'), textcontroller: inputTwoController)
                      ],
                    ),
                  )

              ),
              SizedBox(height: 20,),
              Container(
                color: Colors.blueAccent,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: (){
                      if(formstate.currentState!.validate())
                      {
                        print("innnnnn");
                        // price = int.parse(inputOneController.text) + int.parse(inputTwoController.text) ;
                        // print(price);
                        obj.getSumFunc(int.parse(inputOneController.text) ,  int.parse(inputTwoController.text));
                        // setState(() {
                        //   price = int.parse(inputOneController.text) + int.parse(inputTwoController.text) ;
                        // });


                      }
                      else
                      {
                        print("error");
                      }
                    },child: Text('Get sum'),
                  ),
                ),
              )



            ],
          ),
        ),
      );

}}
