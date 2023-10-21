import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/notes/screens/add_notes.dart';
import 'package:to_do_app/modules/notes/cubit/cubit.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';
import 'package:to_do_app/modules/notes/screens/update_notes.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import '../../welcome/screens/welcome_screen.dart';
import 'delete_note.dart';


class HomeNotes extends StatelessWidget {
  const HomeNotes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NotesCubit,NotesStates>(
        listener:(context,state){} ,
        builder:(context,state){
          NotesCubit cubit = BlocProvider.of(context);
          return Scaffold(
            backgroundColor: kLightGrey,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height:20 ,
                    ),
                    Container(
                      height:70 ,
                      width:double.infinity,
                      decoration: BoxDecoration(
                        color: kPrimaryBlue ,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 20,
                            height: 25,
                            child: IconButton(
                              onPressed:(){
                                navigateTo(context: context, screen:const WelcomeScreen());
                              },
                              padding: const EdgeInsets.all(0.0),
                              icon: const Icon(Icons.arrow_back_ios,
                                size: 25,
                              ),
                              color: kOrange,
                            ),
                          ),
                          const Text('Simply write your notes ' ,
                            style:TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                            ) ,
                          ),
                          Image.asset('assets/images/img.png',
                            width: 30, height: 30,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height:30 ,
                    ),
                    const Text('Notes',
                      style:TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.bold
                      ) ,
                    ),
                    const SizedBox(
                      height:10 ,
                    ),
                    Expanded(
                      child: (cubit.notes.isNotEmpty)? ListView.separated(
                          itemBuilder:(context,index)=>buildNote(context,cubit.notes[index]),
                          separatorBuilder: (context,index)=> const SizedBox(
                            height:20 ,
                          ),
                          itemCount:cubit.notes.length)
                            : reloadWidget(
                          text: 'Add notes' ,
                          image: 'assets/images/img.png',
                      ),
                    ),
                  ],
                ),
              ),
            ),
            floatingActionButton:FloatingActionButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder:(context)=>AddNotesScreen()));
              },
              backgroundColor:kPrimaryBlue ,
              child:Image.asset('assets/images/NoPath - Copy (61).png') ,
            ) ,
          );
        }
    );
  }
  Widget buildNote(context,Map note){
    return GestureDetector(
      onLongPress: (){
        deleteNote(
          context: context,
          id: note['id'],
        );
      },
      onTap:(){
        navigateTo(context: context, screen:UpdateNote(
          id:note['id'] ,
          text:'${note['text']}' ,
        ),
        );
      } ,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
        color:kOrange.withOpacity(0.7),
        borderRadius: BorderRadius.circular(15),
      ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text( '${note['text']}',
              style:const TextStyle(
                color: Colors.black,
                fontSize: 16,
              ) ,
            ),
             const SizedBox(
               height: 5,
             ),
             Text('${note['time']}',
               style:TextStyle(
                 color: Colors.grey[700],
                 fontSize: 12,
               ) ,
             ),
          ],
        ),
      ),
    );
  }
}
