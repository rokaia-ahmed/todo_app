
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/notes/screens/home_notes.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import '../../Tasks/screens/home_screen.dart';

void switchDialog({
  required  context,
}){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: kLightGrey,
          contentPadding: const EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: const Text('start with ',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: kOrange,
            ),
          ),
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: (){
                  navigateTo(context: context, screen:const HomeScreen());
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/9069 [Converted] (1).png',
                    width:100 ,
                      height: 100,
                    ),
                    const SizedBox(height: 5,),
                    const Text('Tasks ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:kPrimaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: (){
                  navigateTo(context: context, screen:const HomeNotes());
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/img.png',
                      width:100 ,
                      height: 100,
                    ),
                    const SizedBox(height: 5,),
                    const Text('Notes',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:kPrimaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }
  );

}