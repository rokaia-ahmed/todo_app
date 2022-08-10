import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/notes/cubit/cubit.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';
import 'package:to_do_app/modules/notes/home_notes.dart';
import 'package:to_do_app/shared/components.dart';

import '../../shared/colors.dart';

class AddNotesScreen extends StatelessWidget {
   TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
      listener:(context,state){} ,
      builder:(context,state){
        NotesCubit cubit = BlocProvider.of(context);
        return Scaffold(
          backgroundColor:kPrimaryBlue ,
          body:SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Center(
                      child: Text('Add Notes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 400,
                      padding: const EdgeInsets.all(15) ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextFieldWithoutBorder(
                            hintText:'Address',
                            textSize: 25,
                            fontWeight: FontWeight.bold,
                            color:kPrimaryBlue ,
                            icon: Icons.push_pin,
                            hintStyle: TextStyle(
                              color: Colors.grey,
                              fontSize: 30,
                            ),

                          ),
                          buildTextFieldWithoutBorder(
                            hintText: 'Observation',
                            textSize:18 ,
                            controller:textController ,
                            hintStyle:TextStyle(
                              color: Colors.grey[300],
                              fontSize: 20,
                            ),

                          ),
                        ],
                      ),
                      decoration:BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                        ),
                      ) ,
                    ),
                    SizedBox(height: 30),
                    buildButton(onPressed: (){
                      cubit.insertDatabase(
                        title:textController.text,
                        time: TimeOfDay.now().format(context).toString(),
                      ).then((value){
                        navigateTo(context: context, screen:HomeNotes());
                      });
                    },
                      height: 40,
                      width:290 ,
                      text: 'Save Notes',
                    ),
                    SizedBox(height: 80),
                    buildLogo(),
                  ],
                ),
              ),
            ),
          ) ,
        );
      } ,
    );
  }
}
