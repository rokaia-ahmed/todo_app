
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'colors.dart';


Widget buildLogo(){
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/logo.png',
        width: 30, height: 30,
        fit: BoxFit.cover,
        color: Colors.white,
      ),
      Text('Tasks',
        style:TextStyle(
          color: Colors.white,
          fontSize: 25,
        ) ,
      ),
    ],
  );
}

Widget buildTextFormField({
  required TextEditingController controller,
  Key? key,
  FormFieldValidator<String> ? validate ,
  bool isEnabled =true ,
  VoidCallback? onTap ,
}){
  return Container(
    height: 50,
    child: TextFormField(
      key:key ,
      enabled:isEnabled ,
      validator:validate ,
      onTap:onTap ,
      cursorColor: Colors.grey,
      controller: controller,
      style: TextStyle(
        color: Colors.white
      ),
      decoration:InputDecoration(
        enabledBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:BorderSide(
            color: kLightGrey,
          ),
        ) ,
        focusedBorder:OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide:BorderSide(
            color:Colors.grey,
          ),
        )  ,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ) ,
    ),
  ) ;
}
Widget buildButton({

 required VoidCallback onPressed ,
  required String text ,
  double? width,
  double ?height,
}){
  return  MaterialButton(
    onPressed:onPressed ,
    color: kButtonBlue,
    minWidth: width ,
    height:height ,
    padding:EdgeInsets.all(20) ,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Text(text,
      style: TextStyle(
        color: Colors.white,
        fontSize: 22,
      ),
    ),
  );
}

Widget buildTextFieldWithoutBorder({
  required String hintText,
  required TextStyle hintStyle,
  TextEditingController? controller ,
  IconData? icon ,
  double? textSize ,
  Color? color ,
  FontWeight? fontWeight,
}){
  return Container(
    height: 30,
    child: TextFormField(
      cursorColor:Colors.grey ,
      controller:controller ,
      style: TextStyle(
        decoration: TextDecoration.none,
        decorationStyle: TextDecorationStyle.dotted,
        decorationColor: Colors.white,
        fontWeight:fontWeight ,
        fontSize: textSize,
        color: color,
      ),
      decoration:InputDecoration(
        suffixIcon:Icon(icon,
          color: Colors.grey,
        ) ,
       /* prefixIcon:Icon(icon,
        color: Colors.grey,
        ) ,*/
        hintText: hintText,
        hintStyle: hintStyle,
        border: InputBorder.none,
        focusedBorder: InputBorder.none,
      ) ,
    ),
  );
}

void navigateTo({
  required BuildContext context,
  required Widget screen ,
}){
  Navigator.push(context,MaterialPageRoute(builder: (context)=>screen));
}

void toast({
  required String msg ,
}){
      Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget reloadWidget({String? text ,String? image }){
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Image.asset('$image',
          color:Colors.grey ,
          width:100 ,
          scale: 3,
        ),
        Text(text!,
          style:TextStyle(
            color:kPrimaryBlue,
            fontSize: 25,
          ) ,
        ),
      ],
    ),
  );
}