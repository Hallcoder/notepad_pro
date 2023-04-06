import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/components/Form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static final  String id=  "loginid";
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text('Hello there, \nWelcome Back',style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold
              ),),
            CustomForm()
            ],
          ),
        ),
      ),
    );
  }
}
