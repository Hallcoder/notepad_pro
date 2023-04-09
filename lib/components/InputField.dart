import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/constants.dart';

class TextInput extends StatefulWidget {
  const TextInput({Key? key, required this.placeholder, required this.icon, required this.onChanged, required this.password}) : super(key: key);
  final String placeholder;
  final Widget icon;
  final bool password;
  final void Function(String,String)? onChanged;
  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool showPassword = false;
  @override
  void initState() {
    showPassword = widget.password;
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      margin: const EdgeInsets.all(12.0),
      child: TextField(
        obscureText: showPassword,
        onChanged: (value){
          widget.onChanged!(widget.placeholder.toLowerCase(),value);
        },
        decoration:  InputDecoration(
            prefixIcon: widget.icon,
            suffixIcon: widget.password ? IconButton(
              onPressed: (){
                setState(() {
                  showPassword = !showPassword;
                });
              },
              icon: !showPassword ? const Icon(Icons.visibility_off):const Icon(Icons.visibility),
            ):Container(width: 2.0,),
            hintText: widget.placeholder
        )
      ),
    );
  }
}
