import 'package:flutter/material.dart';
import 'package:sticky_note/googlesheet_api.dart';
import 'package:sticky_note/mytext_box.dart';
import 'package:sticky_note/loading_circle.dart';

class NoteGrid extends StatelessWidget {

  // final String text;
  // final int numberOfNotes;
  // NoteGrid({required this.text , required this.numberOfNotes});

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: GoogleSheetApi.loading == true ? LoadingCircle()  : GridView.builder(
            itemCount: GoogleSheetApi.currentNotes.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context , index){
              return MyTextBox(text: GoogleSheetApi.currentNotes[index]);
            })
    );
  }
}
