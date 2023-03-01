import 'package:flutter/material.dart';
import 'package:gdscproject/Login/Login_Screen.dart';

import 'Layout/layoutScreen.dart';
import 'Rigister/RigisterScreen.dart';
import 'animatedList/AnimatedList.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}


