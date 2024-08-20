//import 'package:api_app/HomeScreen.dart';
//import 'package:api_app/HomeScreen2.dart';
//import 'package:api_app/HomeScreen3.dart';
import 'package:api_app/Screens/HomeScreen.dart';
import 'package:api_app/Screens/HomeScreen2.dart';
import 'package:api_app/Screens/HomeScreen3.dart';
import 'package:api_app/Screens/HomeScreen4.dart';
import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
  return  MaterialApp(
  debugShowCheckedModeBanner: false,
  
  
  initialRoute: HomeScreen.id,
  routes: {
  HomeScreen.id :(context) => const HomeScreen(),
  HomeScreen2.id : (context) => const HomeScreen2(),
  HomeScreen3.id :(context) => const HomeScreen3(),
  HomeScreen4.id :(context) =>  HomeScreen4(),
  
  },
  
  );
  }
}

