import 'package:flutter/material.dart';
import 'package:notepad_pro/screens/CreateNote.dart';
import 'package:notepad_pro/screens/Home.dart';
import 'package:notepad_pro/screens/Login.dart';
import 'package:notepad_pro/screens/Register.dart';
import 'package:notepad_pro/screens/Settings.dart';
import 'package:notepad_pro/screens/Welcome.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
   Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
     initializeApp();
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: Welcome.id,
      routes: {
        Welcome.id:(context) => const Welcome(),
        Register.id:(context) => const Register(),
        Login.id:(context) => const Login(),
        Home.id:(context) => const Home(),
        CreateNote.id:(context) => const CreateNote(),
        Settings.id:(context) => const Settings()
      },
    );
  }
}
