import 'package:flutter/material.dart';
import 'package:todo_list_gsheet/googlesheet_api.dart';
import 'package:todo_list_gsheet/mytext_box.dart';
import 'package:todo_list_gsheet/loading_circle.dart';

class NoteGrid extends StatelessWidget {
  const NoteGrid({super.key});


  @override
  Widget build(BuildContext context) {
    return  Expanded(
        child: GoogleSheetApi.loading == true ? const LoadingCircle()  : GridView.builder(
            itemCount: GoogleSheetApi.currentNotes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemBuilder: (BuildContext context , index){
              return MyTextBox(text: GoogleSheetApi.currentNotes[index][0]);
            })
    );
  }
}
