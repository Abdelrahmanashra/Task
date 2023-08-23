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
              )

            ],
          ),
        ),
      ),
    );
  }
}
