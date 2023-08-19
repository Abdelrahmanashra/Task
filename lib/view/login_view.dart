import 'package:flutter/material.dart';
import 'package:mano_task/constnats/my_colors.dart';
import 'package:mano_task/view/bottomnav_view.dart';
import 'package:mano_task/view/signup_view.dart';

import '../shared/custom_text_field.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),) ,centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Container(

        child: Column(
          children: [
            Form(
                key: formstate,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){
                  return BottomNavBar();
                }));
              }
              else
              {
                print("error");
              }
              print(emailController.text);
              print(passwordController.text);
            }, child: Container(height: 30,width: 100,color: Colors.blueAccent,child: Center(child: Text('Login',style:TextStyle(color: Colors.white),)))),
            Text('OR'),
            TextButton(onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return SignUp();
              }));

            }, child: Container(height: 30,width: 100,color: Colors.blueAccent,child: Center(child: Text('Create account',style:TextStyle(color: Colors.white),)))),

          ],
        ),
      ),
    );
  }
}
