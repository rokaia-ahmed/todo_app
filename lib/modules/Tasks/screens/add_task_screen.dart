import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import 'home_screen.dart';


class AddTaskScreen extends StatelessWidget {
   AddTaskScreen({Key? key}) : super(key: key);
   final  GlobalKey<FormState> formKey =
   GlobalKey<FormState>();
   final titleController = TextEditingController();
   final listController  = TextEditingController();
   final timeController  = TextEditingController();
   final descriptionController  = TextEditingController();
  @override
  Widget build(BuildContext context) {
    TodoCubit cubit = BlocProvider.of(context);
    return BlocConsumer<TodoCubit,TodoStates>(
      listener:(context ,states) {},
      builder:(context,states){
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
                        validate: (v){
                          if(v!.isEmpty){
                            return 'title is required' ;
                          }
                          return null ;
                        }
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
                          validate: (v){
                            if(v!.isEmpty){
                              return 'addList is required' ;
                            }
                            return null ;
                          }
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
                          validate: (v){
                            if(v!.isEmpty){
                              return 'date is required' ;
                            }
                            return null;
                          },
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
                            if(formKey.currentState!.validate()){
                              cubit.insertDatabase(
                                title: titleController.text,
                                list: listController.text,
                                time: timeController.text,
                                desc: descriptionController.text,
                              ).then((value){
                                Navigator.push(context,
                                    MaterialPageRoute(builder:(context)=>const HomeScreen()),
                                );
                              });
                            }
                          },
                          text: 'Add Tasks',
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
