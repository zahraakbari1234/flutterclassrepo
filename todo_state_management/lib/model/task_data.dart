import 'package:flutter/cupertino.dart';
import 'package:todo_state_management/model/task.dart';


class TaskData extends ChangeNotifier{

  //singleton so can have instance just once

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

  void UpdateTask(Task task){
    task.toggleTask();
    notifyListeners();
  }

  void removeTask(Task task){
    tasks.remove(task);
    notifyListeners();
  }

}