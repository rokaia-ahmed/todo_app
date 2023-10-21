import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/notes/cubit/cubit.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';
import 'package:to_do_app/modules/notes/screens/home_notes.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';


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
              contentPadding: const EdgeInsets.all(20),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              title: const Text('do you want to delete note?',
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
                          navigateTo(context: context, screen:const HomeNotes());
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
                        navigateTo(context: context, screen:const HomeNotes());
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