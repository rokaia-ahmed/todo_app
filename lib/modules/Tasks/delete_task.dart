import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/Tasks/cubit/cubit.dart';
import 'package:to_do_app/modules/Tasks/cubit/state.dart';
import 'package:to_do_app/shared/components.dart';
import '../../shared/colors.dart';
import 'home_Screen.dart';

void deleteTask({
  required  context,
  required String title,
  required int id ,
}){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return BlocConsumer<TodoCubit,TodoStates>(
          listener: (context,state){},
          builder:(context,state){
            TodoCubit cubit = BlocProvider.of(context);
            return AlertDialog(
              backgroundColor: kPrimaryBlue,
              contentPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: Text('do you want to delete task($title)?',
                style: TextStyle(
                  fontSize: 20,
                  color: kOrange,
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    MaterialButton(
                      onPressed:(){
                        cubit.deleteDatabase(id: id).then((value){
                          navigateTo(context: context, screen:HomeScreen());
                        });
                      } ,
                      hoverColor:Colors.white ,
                      highlightColor:Colors.white  ,
                      textColor:Colors.red ,
                      shape:RoundedRectangleBorder(
                          side:BorderSide(
                            color: Colors.white,
                          ) ,
                          borderRadius: BorderRadius.circular(15)
                      ) ,
                      child: Text('yes',
                        style: TextStyle(
                          fontSize: 14,
                          color: kOrange,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed:(){
                        navigateTo(context: context, screen:HomeScreen());
                      } ,
                      hoverColor:Colors.white ,
                      highlightColor:Colors.white  ,
                      textColor:Colors.red ,
                      shape:RoundedRectangleBorder(
                          side:BorderSide(
                            color: Colors.white,
                          ) ,
                          borderRadius: BorderRadius.circular(15)
                      ) ,
                      child: Text('NO',
                        style: TextStyle(
                          fontSize: 14,
                          color: kOrange,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            );
          } ,
        );
      }
  );

}