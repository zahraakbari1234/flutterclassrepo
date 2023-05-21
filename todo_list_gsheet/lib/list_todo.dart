import 'package:flutter/material.dart';
import 'package:todo_list_gsheet/googlesheet_api.dart';
import 'package:todo_list_gsheet/mytext_box.dart';
import 'package:todo_list_gsheet/loading_circle.dart';

class ToDoList extends StatelessWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleSheetApi.loading == true
          ? const LoadingCircle()
          : ListView.builder(
              itemCount: GoogleSheetApi.currentNotes.length,
          itemBuilder: (BuildContext context, int index) {
                return MyTextBox(text: GoogleSheetApi.currentNotes[index][0]);
              },
            ),
    );
  }
}
