import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/components/Form.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);
  static const  String id =  "loginid";
  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool showSpinner = false;
  void setLoading(){
    setState(() {
      showSpinner = !showSpinner;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:  [
                const Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    child: Image(
                      width: 100.0,
                      height: 50.0,
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                const Text('Hello there, \nWelcome Back',style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold
                ),),
              CustomForm(register: true,showSpinner:setLoading)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
