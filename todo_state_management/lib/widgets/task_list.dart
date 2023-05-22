import 'package:flutter/material.dart';
import 'package:todo_state_management/widgets/task_tile.dart';
import 'package:todo_state_management/model/task.dart';

class TaskList extends StatefulWidget {
  const TaskList({
    super.key,
  });

  @override
  State<TaskList> createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {

  List<Task> tasks = [
    Task(taskName: "buy milk", isDone: true),
    Task(taskName: "go gym", isDone: false),
    Task(taskName: "bake cake", isDone: false),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context , index){
      return TaskTile(taskTitle: tasks[index].taskName, isChecked: tasks[index].isDone ,
      checkBoxState: (checkBoxState){
        setState(() {
          tasks[index].toggleTask();
        });
      },
      );

    });
  }
}