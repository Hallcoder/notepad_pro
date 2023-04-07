import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/components/InputField.dart';
import 'package:notepad_pro/screens/Login.dart';
import 'package:notepad_pro/screens/Register.dart';

import '../screens/Home.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key, required this.register}) : super(key: key);
  final bool register;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            widget.register
                ? const TextInput(
                    placeholder: 'Username',
                    icon: Icon(Icons.person),
                  )
                : Container(),
            const TextInput(
              placeholder: 'Email',
              icon: Icon(Icons.mail),
            ),
            const TextInput(
              placeholder: 'Password',
              icon: Icon(Icons.shield),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                Navigator.pushNamed(context,Home.id);
              },
              child: Text(widget.register ? 'SIGN UP' : 'LOGIN'),
            ),
            GestureDetector(
              onTap: () {

                Navigator.pushNamed(context, widget.register ? Login.id:Register.id);
              },
              child: Text(
                widget.register
                    ? 'Already have an account?'
                    : "Don't have an account?",
                style: const TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            )
          ],
        ));
  }
}
