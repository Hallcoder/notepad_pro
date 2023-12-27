import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/components/InputField.dart';
import 'package:notepad_pro/screens/Home.dart';
import 'package:notepad_pro/screens/Login.dart';
import 'package:notepad_pro/screens/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CustomForm extends StatefulWidget {
  const CustomForm(
      {Key? key, required this.register, required this.showSpinner})
      : super(key: key);
  final bool register;
  final void Function() showSpinner;

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formkey = GlobalKey<FormState>();
   String username = '';
   String email = '';
   String password = '';
  String error = '';
  final auth = FirebaseAuth.instance;

  void handleSubmit() async {
    if(email.trim().isEmpty || password.trim().isEmpty){
      widget.showSpinner();
      Future.delayed(Duration(milliseconds: 1000)).then((value){
        print('They are empty lol');
        setState(() {
          error = 'Email or Password cannot be empty!';
        });
        widget.showSpinner();
      });

      Future.delayed(const Duration(milliseconds: 5000)).then((value){
        setState(() {
          error = '';
        });
        return;
      });

    }
    try {
      if (widget.register) {
        widget.showSpinner();
        final newUser = await auth.createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        if (newUser != null) {
          await FirebaseFirestore.instance
              .collection('users')
              .doc(newUser.user!.uid)
              .set({username: username});
          widget.showSpinner();
          Navigator.pushNamed(context, Home.id);
        }
      } else {
        print('Trying to login');
        widget.showSpinner();
        final normalUser =  await auth.signInWithEmailAndPassword(
            email: email.trim(), password: password.trim());
        print(normalUser);
        if (normalUser != null) {
          Navigator.pushNamed(context, Home.id);
        }
        widget.showSpinner();
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        error = e.message!;
      });
      widget.showSpinner();
    }
  }

  void handleInputChange(String input, String value) {
    setState(() {
      switch (input) {
        case 'username':
          print('Username changing');
          username = value;
          break;
        case 'email':
          print('Email changing');
          email = value;
          break;
        case 'password':
          print('Password changing');
          password = value;
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            Text(
              error,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
            ),
            widget.register
                ? TextInput(
                    password: false,
                    onChanged: handleInputChange,
                    placeholder: 'Username',
                    icon: const Icon(Icons.person),
                  )
                : Container(),
            TextInput(
              password: false,
              placeholder: 'Email',
              icon: const Icon(Icons.mail),
              onChanged: handleInputChange,
            ),
            TextInput(
              password: true,
              placeholder: 'Password',
              icon: const Icon(Icons.shield),
              onChanged: handleInputChange,
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              onPressed: () {
                handleSubmit();
              },
              child: Text(widget.register ? 'SIGN UP' : 'LOGIN'),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                    context, widget.register ? Login.id : Register.id);
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
