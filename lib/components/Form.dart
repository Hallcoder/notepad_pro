import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({Key? key}) : super(key: key);

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final _formkey  = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.mail)
              ),
            ),
            TextFormField(
              decoration: const InputDecoration(
                  icon: Icon(Icons.mail)
              ),
            )
          ],
        )
    );
  }
}
