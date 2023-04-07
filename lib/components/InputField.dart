import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/constants.dart';

class TextInput extends StatefulWidget {
  const TextInput({Key? key, required this.placeholder, required this.icon}) : super(key: key);
  final String placeholder;
  final Widget icon;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: const EdgeInsets.all(12.0),
      child: TextFormField(
        decoration:  InputDecoration(
            prefixIcon: widget.icon,
            hintText: widget.placeholder
        )
      ),
    );
  }
}
