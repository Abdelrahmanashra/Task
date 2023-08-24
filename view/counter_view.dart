import 'package:flutter/material.dart';
import 'package:mano_task/shared/custom_text_field.dart';

class Counter extends StatefulWidget {
  Counter({Key? key}) : super(key: key);


  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  TextEditingController inputOneController=TextEditingController();
  TextEditingController inputTwoController=TextEditingController();

  var price = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),) ,centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Container(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Sum = ${price}'),
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
                      setState(() {
                        price = int.parse(inputOneController.text) + int.parse(inputTwoController.text) ;
                      });


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
  }
}
