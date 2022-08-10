import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/modules/notes/cubit/states.dart';

class NotesCubit extends Cubit<NotesStates>{
  NotesCubit(super.initialState);
  static NotesCubit get(context)=> BlocProvider.of(context);

  String? time ;
  Database? database ;
  List<Map> notes =[];
  void createDatabase()async{
    database =await openDatabase(
        'note.db',
        version: 1 ,
        onCreate: (database,version){
          database.execute(
              'create table notes(id integer primary key,text text,time text)')
              .then((value){
            print('notes table creating');
          }).catchError((error){
            print('error on creating table${error.toString()}');
          });
          print('notes database created');
        },
        onOpen: (database){
          getDatabase(database);
          print(' notes database opened');
        }
    );
  }

  Future insertDatabase({
    required String title,
    required String time ,
  }){
    return database!.transaction((txn){
      return txn.rawInsert(
          'insert into notes (text,time) values ("$title","$time")')
          .then((value){
        getDatabase(database);
        emit(InsertNotesState());
        print('$value insert success');
      }).catchError((error){
        print('error on insert table${error.toString()}');
        emit(ErrorInsertNotesState());
      }) ;
    });
  }

  Future getDatabase(database)async{
    notes = await database!.rawQuery('select * from notes');
    print(notes);
    emit(GetNotesState());
  }

  Future updateDatabase({
    required int id ,
    String? text,
  })async{
    await database!.rawUpdate(
      'UPDATE notes SET text = ? WHERE id = ?',
      ['$text','$id'],
    ).then((value){
      print('update notes  done');
      getDatabase(database);
      emit(UpdateNotesState());
    }).catchError((error){
      print('Error when update notes database$error');
    });
  }
  Future deleteDatabase({required id})async{
    await database!
        .rawDelete('DELETE FROM notes WHERE id = $id ',
    ).then((value){
      getDatabase(database);
      emit(DeleteNotesState());
    }).catchError((error){
      print('error when delete task :$error');
    });
  }

}