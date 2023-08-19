import 'package:flutter/material.dart';
import 'package:mano_task/constnats/my_colors.dart';
import 'package:mano_task/view/login_view.dart';

import '../shared/custom_text_field.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),) ,centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Container(

        child: Column(
          children: [
            Form(
                key: formstate,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      customTextFiled(obscureText: false,hintText: 'Name',textInputType:TextInputType.text ,textcontroller:nameController ,label: Text('Name')),
                      SizedBox(height: 20,),
                      customTextFiled(obscureText: false,hintText: '@gmail.com',textInputType:TextInputType.text ,textcontroller:emailController ,label: Text('Email')),
                      SizedBox(height: 20,),
                      customTextFiled(obscureText: true,hintText: 'Password',textInputType:TextInputType.text ,textcontroller:passwordController ,label: Text('Password')),
                    ],
                  ),
                )
            ),
            SizedBox(height: 20,),
            TextButton(onPressed: (){
              if(formstate.currentState!.validate())
              {
                print("innnnnn");
                Navigator.of(context).push(MaterialPageRoute(builder: (context){
                  return Login();
                }));

              }
              else
              {
                print("error");
              }
              print(nameController.text);
              print(emailController.text);
              print(passwordController.text);
            }, child: Container(height: 30,width: 100,color: Colors.blueAccent,child: Center(child: Text('Sign Up',style:TextStyle(color: Colors.white),)))),

          ],
        ),
      ),
    );
  }
}
