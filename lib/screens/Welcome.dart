import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/screens/Register.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);
  static const String id = "welcome screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircleAvatar(
                    child: Image(image: AssetImage('assets/images.jpeg'))),
                const Text(
                  'Notepad_Pro',
                  style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
                ),
                Container(
                  width: 100.0,
                  child: ElevatedButton(
                      onPressed: () {
                        if (kDebugMode) {
                          print("Next page");
                        }
                        Navigator.pushNamed(context, Register.id);
                      },
                      child: Row(
                        children: const [
                          Icon(Icons.navigate_next),
                          Text(
                            'Next',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          )
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
