import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  Widget gridCourses(){
    return Container(

      //height: MediaQuery.of(context).size.height,
      child: GridView.builder(
          itemCount: 6,
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 20,crossAxisSpacing: 10,childAspectRatio: 80 / 110 ),
          itemBuilder: (context,i){
            return  InkWell(onTap: (){
              // Navigator.of(context).push(MaterialPageRoute(builder: (context){
              //   return CourseDetails(course: obj.response['data'][i]);
              // }));
            },
              child: Container(
                //height: 700,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  gradient:LinearGradient(
                    colors: [
                      Color(0xff886ff2),
                      Color(0xff6849ef),

                      //add more colors for gradient
                    ],
                    begin: Alignment.topLeft, //begin of the gradient color
                    end: Alignment.topRight, //end of the gradient color
                  ),
                ),
                child:  Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30)),
                      child: Image.asset("assets/images/one.jpg",fit: BoxFit.cover,),
                      //Image.asset("images/1.jpg",alignment: Alignment.center,),
                    ),
                    const SizedBox(height: 10,),

                    //Text("${snapshot.data['data'][i]['course_name']}",style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 5,),
                    //AutoSizeText(minFontSize: 12,maxLines:1 ,"${snapshot.data['data'][i]['course_name']}",style: TextStyle(fontSize: 18,color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("FIFA 23",style: const TextStyle(color: Colors.white,fontSize: 12),),
                    const SizedBox(height: 5,),
                    Text("450 L.E",style: const TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.bold),),

                  ],
                ),

              ),
            );

          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('New products'),centerTitle: true,),
      body: Container(
        child: gridCourses(),
      ),
    );
  }
}
