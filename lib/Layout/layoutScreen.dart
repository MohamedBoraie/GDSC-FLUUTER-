import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class layoutScreen extends StatefulWidget{

  @override
  State<layoutScreen> createState() => _layoutScreenState();
}

class _layoutScreenState extends State<layoutScreen> {
  int NumList=0;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
   return Scaffold(
backgroundColor: Colors.cyanAccent,
     body: Column(
      children: [
        Container(
          height:size.height/6 ,
          width: double.infinity,
          color: Colors.red,
       child:Padding(
         padding:  EdgeInsetsDirectional.only(top: size.height/10),
         child: Center(child: Text('Flutter Map',style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),)),
       ),
        ),
        SizedBox(
          height: 15,
        ),
          IconButton(onPressed: (){
            setState(() {
              NumList++;
            });},
              icon: Icon(CupertinoIcons.add,color: Colors.white,size: 30,)),
        Expanded(
          child: AnimationLimiter(

            child: ListView.separated(
              physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) =>ListItem(index),
                separatorBuilder: (context, index) => SizedBox(height: size.height/50,),
                itemCount: 20),
          ),
        )
      ],
     ),
   );
  }
}
Widget ListItem (int s)=>AnimationConfiguration.staggeredList(
position: s,
  delay: Duration(seconds: 1),
  child:   SlideAnimation(
    delay: Duration(seconds: 3),
    curve: Curves.fastLinearToSlowEaseIn,
    horizontalOffset: -300,
    verticalOffset: -850,
    child: Padding(
      padding:  EdgeInsetsDirectional.only(start: 10,
      end: 10),
      child:   Container(
        height: 50,
      decoration: BoxDecoration(
        color: Colors.purple,
    boxShadow:[ BoxShadow(
    color: Colors.purpleAccent,
    spreadRadius: 1,
    blurRadius: 4,
    offset:const Offset(0,3)
    )],
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
        border: Border.all(
    color: Colors.transparent
        ),
      ),
      child: Row(
        children: [
          Text('  Item $s',style: TextStyle(color: Colors.white,fontSize: 25),),
          Spacer(),
          Padding(
            padding:  const EdgeInsetsDirectional.only(end: 10),
            child: IconButton(onPressed: (){}, icon: Icon(Icons.delete_outline,color: Colors.red,)),
          )
        ],
      ),
      ),
    ),
  ),
);
