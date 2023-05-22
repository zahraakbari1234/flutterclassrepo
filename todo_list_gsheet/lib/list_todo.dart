import 'package:flutter/material.dart';
import 'package:todo_list_gsheet/googlesheet_api.dart';
import 'package:todo_list_gsheet/mytext_box.dart';
import 'package:todo_list_gsheet/loading_circle.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({Key? key}) : super(key: key);

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GoogleSheetApi.loading == true
          ? const LoadingCircle()
          : ListView.builder(
              itemCount: GoogleSheetApi.currentNotes.length,
              itemBuilder: (BuildContext context, int index) {
                return CheckboxListTile(
                    title: Text(GoogleSheetApi.currentNotes[index][0]),
                    value: GoogleSheetApi.currentNotes[index][1] == 1
                        ? true
                        : false,
                    onChanged: (newValue) {
                      GoogleSheetApi.update(index, newValue == true ? 1 : 0);
                      setState(() {
                        GoogleSheetApi.currentNotes[index][1] =
                            newValue == true ? 1 : 0;
                      });
                    });
              },
            ),
    );
  }
}
