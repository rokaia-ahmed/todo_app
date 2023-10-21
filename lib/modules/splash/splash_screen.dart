
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/welcome/screens/welcome_screen.dart';

import '../../core/colors.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _BuildSplashScreenState();
}
class _BuildSplashScreenState extends State<SplashScreen> {
 @override
  void initState(){
 super.initState();
  Timer( const Duration(seconds:5,),
     ()=> Navigator.pushReplacement(context,
         MaterialPageRoute(builder:(context)=>const WelcomeScreen()),
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
             const Text('Tasks',
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
