import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/notes/cubit/cubit.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';
import 'package:to_do_app/modules/splash/splash_screen.dart';
import 'modules/Tasks/cubit/cubit.dart';
import 'modules/Tasks/cubit/state.dart';



void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          lazy: false,
        create:(context)=>TodoCubit(InitialTodoState())..createDatabase(),
        ),
        BlocProvider(
          create:(context)=> NotesCubit(InitialNotesState())..createDatabase(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner:false ,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:SplashScreen(),
      ),
    );
  }
}

