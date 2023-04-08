import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notepad_pro/components/NoteCard.dart';
import 'package:notepad_pro/screens/CreateNote.dart';
import 'package:notepad_pro/screens/Settings.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static const String id = "homeid";

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //go to create note page with no arguments
          Navigator.pushNamed(context, CreateNote.id);
        },
        backgroundColor: Colors.green,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, Settings.id);
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
            ),
            const Text(
              'Notepad Pro',
              style: TextStyle(color: Colors.black),
            ),
            PopupMenuButton(
                // color: Colors.,
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                itemBuilder: (BuildContext context) => [
                      const PopupMenuItem(child: Text('Profile')),
                      const PopupMenuItem(child: Text('About')),
                  
                    ])
          ],
        ),
      ),
      body: SafeArea(
        child: ListView(children: [
          Column(
            children: [
              Container(
                  margin: EdgeInsets.all(4.0),
                  child: CupertinoSearchTextField()),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard(),
              NoteCard()
            ],
          ),
        ]),
      ),
    );
  }
}
