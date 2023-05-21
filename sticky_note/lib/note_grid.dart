import 'package:flutter/material.dart';
import 'package:sticky_note/mytext_box.dart';

class NoteGrid extends StatelessWidget {

  final String text;
  final int numberOfNotes;
  NoteGrid({required this.text , required this.numberOfNotes});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: GridView.builder(
            itemCount: numberOfNotes,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context , index){
              return MyTextBox(text: text);
            })
    );
  }
}
