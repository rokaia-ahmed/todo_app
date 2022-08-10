
import 'package:flutter/material.dart';
import 'package:to_do_app/shared/colors.dart';

void showTask({
  required BuildContext context,
  required String title,
  required String list ,
  required String time ,
  required String  dec,
}){
  showDialog(context: context, builder:(context)=>AlertDialog(
    backgroundColor: kPrimaryBlue,
    //contentPadding: EdgeInsets.all(20),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    content:Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Text('Title:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            SizedBox(width: 5,),
            Text(title,
              style:TextStyle(
                color:kOrange,
                fontSize: 20,
              ) ,
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('List:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            SizedBox(width: 5,),
            Text('#$list',
              style:TextStyle(
                color: kOrange,
                fontSize: 20,
              ) ,
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('time:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            SizedBox(width: 5,),
            Text(time,
              style:TextStyle(
                color: kOrange,
                fontSize: 20,
              ) ,
            ),
          ],
        ),
        SizedBox(height: 20,),
        Row(
          children: [
            Text('Description:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            SizedBox(width: 5,),
            Expanded(
              child: Text(dec,
                maxLines: 2,
                style:TextStyle(
                  color: kOrange,
                  fontSize:15,
                ) ,
              ),
            ),
          ],
        ),
        SizedBox(height: 30),
      ],
    ) ,
  ),
  );
}

