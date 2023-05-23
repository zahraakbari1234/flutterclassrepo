import 'package:flutter/cupertino.dart';
import 'package:todo_state_management/model/task.dart';
import 'package:provider/provider.dart';

class TaskData extends ChangeNotifier{

  List<Task> tasks = [
    Task(taskName: "task1", isDone: false)
  ];

  int get taskCount {
    return tasks.length;
  }

  void addTask(String newTaskTitle){
    tasks.add(Task(taskName: newTaskTitle, isDone: false));
    notifyListeners();
  }
}