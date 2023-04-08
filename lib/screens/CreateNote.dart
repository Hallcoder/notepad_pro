import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Home.dart';

class CreateNote extends StatefulWidget {
  const CreateNote({Key? key}) : super(key: key);
  static const String id = 'createnoteid';

  @override
  State<CreateNote> createState() => _CreateNoteState();
}

class _CreateNoteState extends State<CreateNote> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.album),label: 'Albums'),
        BottomNavigationBarItem(icon: Icon(Icons.list),label: 'To-do list'),
        BottomNavigationBarItem(icon: Icon(Icons.circle_notifications),label: 'Reminder'),
      ],),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, Home.id);
              },
              child: Container(
                width: 50.0,
                child: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            const Text(
              'Notepad Pro',
              style: TextStyle(fontFamily: 'Poppins', color: Colors.black),
            ),
            const Icon(Icons.share,color: Colors.black,),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ListView(
            children: [
              Container(
                margin: const EdgeInsets.all(6.0),
                child: const TextField(
                  decoration: InputDecoration(hintText: 'Title'),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(6.0),
                child: const TextField(
                  maxLines: 25,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Description'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
