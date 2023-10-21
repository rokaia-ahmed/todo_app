
import 'package:flutter/material.dart';
import '../../../core/colors.dart';
import '../../../core/components.dart';
import '../widgets/switch_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBlue,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              buildLogo(),
              const SizedBox(
                height: 10,
              ),
              Image.asset('assets/images/9069 [Converted] (1).png',
              height: 300, width: 250,
              ),
              const Text('Welcome to tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              ),
             const Padding(
            padding: EdgeInsets.all(20.0),
            child: Text('An application to write your daily personal, work and other tasks',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                height: 1.5 ,
              ),
              ),
          ),
              buildButton(
                onPressed: (){
                  switchDialog(
                    context: context,
                  );

                },
                text: 'Get started',
                width: 300,
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
