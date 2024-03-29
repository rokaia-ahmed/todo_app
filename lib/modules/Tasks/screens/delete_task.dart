import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/Tasks/cubit/cubit.dart';
import 'package:to_do_app/modules/Tasks/cubit/state.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import 'home_screen.dart';

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
              contentPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: Text('do you want to delete task($title)?',
                style: const TextStyle(
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
                          navigateTo(context: context, screen:const HomeScreen());
                        });
                      } ,
                      hoverColor:Colors.white ,
                      highlightColor:Colors.white  ,
                      textColor:Colors.red ,
                      shape:RoundedRectangleBorder(
                          side:const BorderSide(
                            color: Colors.white,
                          ) ,
                          borderRadius: BorderRadius.circular(15)
                      ) ,
                      child: const Text('yes',
                        style: TextStyle(
                          fontSize: 14,
                          color: kOrange,
                        ),
                      ),
                    ),
                    MaterialButton(
                      onPressed:(){
                        navigateTo(context: context, screen:const HomeScreen());
                      } ,
                      hoverColor:Colors.white ,
                      highlightColor:Colors.white  ,
                      textColor:Colors.red ,
                      shape:RoundedRectangleBorder(
                          side:const BorderSide(
                            color: Colors.white,
                          ) ,
                          borderRadius: BorderRadius.circular(15)
                      ) ,
                      child: const Text('NO',
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