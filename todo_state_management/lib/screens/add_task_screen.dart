import 'package:flutter/material.dart';

class AddTaskScreen extends StatelessWidget {
  final Function callBack;
  const AddTaskScreen({required this.callBack});

  @override
  Widget build(BuildContext context) {
    //write it here to be refreshed by setState
    String newTaskTitle = '';

    return Container(
      padding: const EdgeInsets.all(20),
      color: Colors.grey[300],
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Add Task",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30, color: Colors.green[400]),
            ),
             TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (text){
                newTaskTitle = text ;
              },
            ),
            MaterialButton(
              color: Colors.green[300],
              onPressed: () {
                callBack(newTaskTitle);
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
