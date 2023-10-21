import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/notes/cubit/cubit.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';
import 'package:to_do_app/modules/notes/screens/home_notes.dart';

import '../../../core/colors.dart';
import '../../../core/components.dart';


class AddNotesScreen extends StatelessWidget {
  AddNotesScreen({super.key});
  final TextEditingController textController =
  TextEditingController();
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
                    const Center(
                      child: Text('Add Notes',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    Container(
                      width: double.infinity,
                      height: 400,
                      padding: const EdgeInsets.all(15) ,
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(10),
                        ),
                      ) ,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          buildTextFieldWithoutBorder(
                            hintText:'Address',
                            textSize: 25,
                            fontWeight: FontWeight.bold,
                            color:kPrimaryBlue ,
                            icon: Icons.push_pin,
                            hintStyle: const TextStyle(
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
                    ),
                    const SizedBox(height: 30),
                    buildButton(onPressed: (){
                      cubit.insertDatabase(
                        title:textController.text,
                        time: TimeOfDay.now().format(context).toString(),
                      ).then((value){
                        navigateTo(context: context, screen:const HomeNotes());
                      });
                    },
                      height: 40,
                      width:290 ,
                      text: 'Save Notes',
                    ),
                    const SizedBox(height: 80),
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
