import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/components/Form.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);
  static const String id = "string";

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
            Text(
              'Welcome back!',
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30.0),
            ),
            CustomForm(register: false),
          ],
        )),
      ),
    );
  }
}
