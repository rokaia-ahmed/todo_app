import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/notes/cubit/cubit.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';
import 'package:to_do_app/modules/notes/home_notes.dart';

import '../../shared/colors.dart';
import '../../shared/components.dart';

void deleteNote({
  required  context,
  required int id ,
}){
  showDialog(
      context: context,
      builder: (BuildContext context){
        return BlocConsumer<NotesCubit,NotesStates>(
          listener: (context,state){},
          builder:(context,state){
            NotesCubit cubit = BlocProvider.of(context);
            return AlertDialog(
              backgroundColor: kPrimaryBlue,
              contentPadding: EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: Text('do you want to delete note?',
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
                          navigateTo(context: context, screen:HomeNotes());
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
                        navigateTo(context: context, screen:HomeNotes());
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