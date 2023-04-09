import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/screens/Register.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

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
                const Hero(
                  tag: 'logo',
                  child: CircleAvatar(
                    radius: 20.0,
                    child: Image(
                      fit: BoxFit.fill,
                      width: 100.0,
                      height: 50.0,
                      image: AssetImage('assets/logo.png'),
                    ),
                  ),
                ),
                AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText('Notepad_Pro🖊️',
                        speed: Duration(milliseconds: 100),
                        textStyle: const TextStyle(
                            fontSize: 30.0, fontWeight: FontWeight.bold)),
                  ],
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
