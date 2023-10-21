
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/Tasks/cubit/cubit.dart';
import 'package:to_do_app/modules/Tasks/cubit/state.dart';
import 'package:to_do_app/modules/welcome/screens/welcome_screen.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import 'add_task_screen.dart';
import 'delete_task.dart';
import 'show_task.dart';
import 'update_tasks.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TodoCubit cubit =BlocProvider.of(context);
    return BlocConsumer<TodoCubit,TodoStates>(
      listener:(context,states){
      } ,
      builder:(context,states){
        return Scaffold(
          backgroundColor: kLightGrey,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height:20 ,
                  ),
                  Container(
                    height:60 ,
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
                        const Text('Simply control your time ' ,
                          style:TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ) ,
                        ),
                        Image.asset('assets/images/9069 [Converted] (1).png',
                          width: 30, height: 30,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height:30 ,
                  ),
                  const Text('Tasks',
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
                    child: (cubit.tasks.isNotEmpty)?
                    ListView.separated(
                        itemBuilder:(context,index)=>
                            buildTask(context,index,cubit.tasks[index]),
                        separatorBuilder: (context,index)=> const SizedBox(
                          height:20 ,
                        ),
                        itemCount:cubit.tasks.length): reloadWidget(
                         text: 'Add Tasks',
                        image:  'assets/images/9069 [Converted] (1).png',
                    ),
                  ),
                ],
              ),
            ),
          ),
          floatingActionButton:FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:(context)=>AddTaskScreen()));
            },
            backgroundColor:kPrimaryBlue ,
            child:Image.asset('assets/images/NoPath - Copy (61).png') ,
          ) ,
        );
      } ,
    );
  }
  Widget buildTask(context,index,Map map){
    return  Container(
      height: 50,
      width:double.infinity ,
      decoration: BoxDecoration(
        color:Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(),
      ),
      child:Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            onPressed:(){
              TodoCubit.get(context).boxCheck(index) ;
            },
            icon:Icon(
              (map['status']=='done')? Icons.check_circle :Icons.circle_outlined,
              size:30,
              color:Colors.green ,
            ),
          ),
          Expanded(
            child: Text('${map['title']}',
              style:const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  overflow:TextOverflow.ellipsis ,
                  fontWeight: FontWeight.bold
              ) ,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              showTask(context: context,
                title: map['title'],
                list: map['list'] ,
                time: map ['time'] ,
                dec:  map['description'] ,
              );
            },
            child: const Icon(Icons.visibility,
              size:30 ,
              color: Colors.blue,
            ),
          ),
          const SizedBox(width: 10),
          GestureDetector(
            onTap: (){
              navigateTo(context: context,
                screen:UpdateTaskScreen(
                id: map['id'] ,
                title: map['title'],
                list: map['list'],
                time: map['time'],
                description: map['description'],
              ),
              );
            },
            child: Image.asset('assets/images/NoPath - Copy (40).png'),
          ),
          GestureDetector(
            onTap:(){
              deleteTask(
                  context: context,
                  title: map['title'],
                  id: map['id']
              );
            } ,
            child: Image.asset('assets/images/NoPath - Copy (39).png',
            ),
          ),
        ],
      ) ,
    );
  }
}
