import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:to_do_app/modules/Tasks/cubit/state.dart';

class TodoCubit extends Cubit<TodoStates>{
  TodoCubit(super.initialState);
  static TodoCubit get(context)=> BlocProvider.of(context);

  Database? database ;
  List<Map> tasks =[];
  void createDatabase()async{
    database =await openDatabase(
      'todo.db',
      version: 1 ,
      onCreate: (database,version){
        database.execute(
       'create table tasks(id integer primary key,title text , time text ,list text ,description text,status text)')
            .then((value){
          print('table creating');
        }).catchError((error){
          print('error on creating table${error.toString()}');
        });
        print('database created');
      },
       onOpen: (database){
         getDatabase(database);
         print('database opened');
       }
    );
  }
  Future insertDatabase({
  required String title,
    required String time ,
    required String list ,
    String? desc,
}){
   return database!.transaction((txn){
      return txn.rawInsert(
          'insert into tasks (title , time ,list,description ,status)values ("$title","$time","$list","$desc","new")')
          .then((value){
            getDatabase(database);
            emit(InsertDataState());
          print('$value insert success');
      }).catchError((error){
        print('error on insert table${error.toString()}');
         emit(ErrorInsertToDatabaseState());
      }) ;
    });
  }

  Future getDatabase(database)async{
    tasks = await database!.rawQuery('select * from tasks');
   emit(GetDataState());
  }

  Future updateDatabase({
  required int id ,
    String? title,
    String? list ,
    String? time,
    String? dec ,
    String? status ,
})async{
    await database!.rawUpdate(
    'UPDATE Tasks SET title = ?, list = ? ,time =? ,description =?,status =? WHERE id = ?',
        ['$title', '$list', '$time','$dec','$status','$id'],
    ).then((value){
      print('update done');
      print(tasks[0]['status']);
      emit(UpdateDatabaseState());
      getDatabase(database);
    }).catchError((error){
      print('Error when update database$error');
    });
  }

  Future deleteDatabase({required id})async{
    await database!
        .rawDelete('DELETE FROM Tasks WHERE id = $id ',
    ).then((value){
      getDatabase(database);
      emit(DeleteFromDatabaseState());
    }).catchError((error){
      print('error when delete task :$error');
    });
  }

  bool isCheck=false ;
  void boxCheck(index){
    isCheck = !isCheck ;
    if(isCheck){
      updateDatabase(
        id: tasks[index]['id'],
        title:tasks[index]['title'] ,
        time:tasks[index]['time'] ,
        list:tasks[index]['list'],
        dec:tasks[index]['description'] ,
        status: 'done' ,
      );
    }else{
      updateDatabase(
          id: tasks[index]['id'],
          title:tasks[index]['title'] ,
          time:tasks[index]['time'] ,
          list:tasks[index]['list'],
          dec:tasks[index]['description'] ,
          status: 'not done'
      );
    }
    emit(BoxCheckState());
  }
}