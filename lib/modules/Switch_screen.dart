
import 'package:flutter/material.dart';
import 'package:to_do_app/modules/notes/home_notes.dart';
import '../shared/colors.dart';
import '../shared/components.dart';
import 'Tasks/home_Screen.dart';

void switchDialog({
  required  context,
}){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return AlertDialog(
          backgroundColor: kLightGrey,
          contentPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          title: Text('start with ',
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
                  navigateTo(context: context, screen:HomeScreen());
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/9069 [Converted] (1).png',
                    width:100 ,
                      height: 100,
                    ),
                    SizedBox(height: 5,),
                    Text('Tasks ',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:kPrimaryBlue,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: 25,
              ),
              GestureDetector(
                onTap: (){
                  navigateTo(context: context, screen:HomeNotes());
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset('assets/images/img.png',
                      width:100 ,
                      height: 100,
                    ),
                    SizedBox(height: 5,),
                    Text('Notes',
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