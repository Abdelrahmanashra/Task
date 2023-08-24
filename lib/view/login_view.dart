import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mano_task/constnats/my_colors.dart';
import 'package:mano_task/view/bottomnav_view.dart';
import 'package:mano_task/view/signup_view.dart';

import '../shared/custom_text_field.dart';
import 'bottomnav_stateless_view.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  late UserCredential userCredential;
  GlobalKey<FormState> formstate=GlobalKey<FormState>();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();

  Future loginUser(String email, String password)async{
    try {
      userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("********************");
      print(userCredential);
    } on FirebaseAuthException catch  (e) {
      print('bad');
      print('Failed with error code: ${e.code}');
      print(e.message);
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Login',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),) ,centerTitle: true,backgroundColor: Colors.blueAccent,),
      body: Container(

        child: SingleChildScrollView(
          child: Column(

            children: [
              Text('Welcome back! Glad',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
              Text('To see you, Again!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.deepPurple,
                  ),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(onPressed: ()async{
                        if(formstate.currentState!.validate())
                        {
                          await loginUser(emailController.text, passwordController.text);
                          print("innnnnn");
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                            return BottomNavStateless();
                          }));

                        }
                        else
                        {
                          print("error");
                        }
                        print(emailController.text);
                        print(passwordController.text);
                      }, child: Text('Login',style:TextStyle(color: Colors.white),)),

                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Stack(
                children: [
                  Divider(thickness: 1,color: Colors.black,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(color:Colors.white, child: Padding(
                        padding: const EdgeInsets.only(left: 8,right: 8),
                        child: Text('Or Login with'),
                      ),),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.grey),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    width: 100,
                    child: IconButton(
                      onPressed: (){}, icon: Icon(Icons.facebook,color: Colors.blueAccent,),
                    ),),
                  Container(decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                      width: 100,child: IconButton(
                        onPressed: (){}, icon: Icon(Icons.apple),
                      )),
                  Container( decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                      width: 100,child: IconButton(
                        onPressed: (){}, icon: Icon(Icons.g_mobiledata),
                      )),

                ],
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Don\'t have an account?'),
                    TextButton(onPressed: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context){
                        return SignUp();
                      }));
                    }, child: Text('Register now',style: TextStyle(color: Colors.red),))
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
