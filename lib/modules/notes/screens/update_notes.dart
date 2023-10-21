import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import 'home_notes.dart';

class UpdateNote extends StatelessWidget {
  final  textController = TextEditingController();
 final int id;
  final String ? text ;
  UpdateNote({super.key, required this.id,this.text});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
      listener:(context,state){} ,
      builder:(context,state){
        textController.text = text! ;
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
                      cubit.updateDatabase(
                        id:id,
                        text: textController.text,
                      ).then((value){
                        navigateTo(context: context,
                            screen:const HomeNotes());
                      });
                    },
                      height: 40,
                      width:290 ,
                      text: 'update Note',
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