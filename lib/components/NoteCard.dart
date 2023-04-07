import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoteCard extends StatefulWidget {
  const NoteCard({Key? key}) : super(key: key);

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        //Navigate to edit note page
      },
      child: Container(
        margin: EdgeInsets.all(4.0),
        width: 400.0,
        height: 60.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), color: Colors.lightBlueAccent,),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text('Morning Workout is Good',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
            Text(
              'April 6, 2023 05:13 PM',
              style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w100),
            )
          ],
        ),
      ),
    );
  }
}
