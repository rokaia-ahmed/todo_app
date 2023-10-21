import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/modules/Tasks/cubit/cubit.dart';
import 'package:to_do_app/modules/Tasks/cubit/state.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import 'home_screen.dart';


class UpdateTaskScreen extends StatelessWidget {
 final int id ;
 final String title ;
 final String list ;
 final String time ;
 final String description ;

  UpdateTaskScreen({super.key,
    required this.id,
    required this.title,
    required this.time ,
    required this.list,
    required this.description });

 final GlobalKey<FormState> formKey = GlobalKey<FormState>();
 final titleController = TextEditingController();
 final listController  = TextEditingController();
 final timeController  = TextEditingController();
 final descriptionController  = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = BlocProvider.of(context);
    return BlocConsumer<TodoCubit,TodoStates>(
      listener:(context ,states) {
      },
      builder:(context,states){
        titleController.text = title ;
        listController.text = list ;
        timeController.text =time ;
        descriptionController.text =description ;
        return Scaffold(
          backgroundColor:kPrimaryBlue ,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Center(
                        child: Text('Add Tasks',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                          ),
                        ),
                      ),
                      const SizedBox(height: 30),
                      const Text('Title',
                        style: TextStyle(
                          color: kOrange,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildTextFormField(
                          controller: titleController,
                      ),
                      const SizedBox(height: 10),
                      const Text('Add to List',
                        style: TextStyle(
                          color: kOrange,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildTextFormField(
                          controller: listController,
                      ),
                      const SizedBox(height: 10),
                      const Text('Time',
                        style: TextStyle(
                          color: kOrange,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      buildTextFormField(
                          controller: timeController ,
                          onTap: (){
                            showTimePicker(context: context,
                                initialTime:TimeOfDay.now())
                                .then((value){
                              timeController.text = value!.format(context).toString();
                              debugPrint(value.format(context).toString());
                            });
                            /* showDatePicker(context: context,
                              initialDate:DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime.parse('2060-10-05'),
                           ).then((value){
                                print(DateFormat.yMMMd().format(value!));
                                timeController.text = DateFormat.yMMMd().format(value);
                          });*/
                          }
                      ),
                      const SizedBox(height: 10),
                      const Text('Description',
                        style: TextStyle(
                          color: kOrange,
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height:150 ,
                        width:double.infinity ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: kLightGrey,
                        ),
                        padding:const EdgeInsets.only(left: 10) ,
                        child:buildTextFieldWithoutBorder(
                            controller: descriptionController,
                            hintText:'Add description her',
                            hintStyle:const TextStyle(
                              color: Colors.grey,
                            )),
                      ),
                      const SizedBox(height: 25),
                      Center(
                        child: buildButton(
                          onPressed: (){
                          cubit.updateDatabase(
                              id: id,
                             // status:'new' ,
                              title: titleController.text,
                              list:listController.text,
                              time:timeController.text,
                              dec: descriptionController.text,
                          ).then((value){
                            navigateTo(context: context, screen:const HomeScreen());
                          });
                          },
                          text: 'Update Task',
                          width: 300,
                          height: 30,
                        ),
                      ),
                      const SizedBox(height: 30),
                      buildLogo(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      } ,
    );
  }
}