import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_state_management/widgets/task_tile.dart';
import 'package:todo_state_management/model/task.dart';

import '../model/task_data.dart';

class TaskList extends StatelessWidget {
  // final List<Task> tasks;
  // TaskList({required this.tasks});


  @override
  Widget build(BuildContext context) {
    /*
    consumer makes a widget of our TaskData so we don't need to call provider everytime we want to use
    a data instead we can just call the object(TaskData) easily

     */
    return Consumer<TaskData>(builder: (context , TaskData , child){
      return ListView.builder(
          itemCount: TaskData.taskCount,//because it is stateful
          itemBuilder: (context , index){
            return TaskTile(taskTitle: TaskData.tasks[index].taskName, isChecked:TaskData.tasks[index].isDone ,
              checkBoxState: (checkBoxState){
                // setState(() {
                //   widget.tasks[index].toggleTask();
                // });
              },
            );

          });
    });

  }
}