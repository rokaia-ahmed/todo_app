
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/welcomeScreen.dart';
import '../shared/colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _BuildSplashScreenState();
}
class _BuildSplashScreenState extends State<SplashScreen> {
 void initState(){
 super.initState();
  Timer( Duration(seconds:5,),
     ()=> Navigator.pushReplacement(context,
         MaterialPageRoute(builder:(context)=>WelcomeScreen()),
     ),
 );
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlue,
     body:Center(
         child: Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
             Image.asset('assets/images/logo.png',
               width:70, height: 70,
               fit: BoxFit.cover,
               color: Colors.white,
             ),
             Text('Tasks',
               style:TextStyle(
                 color: Colors.white,
                 fontSize: 35,
               ) ,
             ),
           ],
         ),

     ) ,
    );
  }
}
