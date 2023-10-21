
import 'package:flutter/material.dart';
import '../../../core/colors.dart';

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
            const Text('Title:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            const SizedBox(width: 5,),
            Text(title,
              style:const TextStyle(
                color:kOrange,
                fontSize: 20,
              ) ,
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            const Text('List:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            const SizedBox(width: 5,),
            Text('#$list',
              style:const TextStyle(
                color: kOrange,
                fontSize: 20,
              ) ,
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            const Text('time:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            const SizedBox(width: 5,),
            Text(time,
              style:const TextStyle(
                color: kOrange,
                fontSize: 20,
              ) ,
            ),
          ],
        ),
        const SizedBox(height: 20,),
        Row(
          children: [
            const Text('Description:',
              style:TextStyle(
                color: Colors.white,
                fontSize: 20,
              ) ,
            ),
            const SizedBox(width: 5,),
            Expanded(
              child: Text(dec,
                maxLines: 2,
                style:const TextStyle(
                  color: kOrange,
                  fontSize:15,
                ) ,
              ),
            ),
          ],
        ),
        const SizedBox(height: 30),
      ],
    ) ,
  ),
  );
}

