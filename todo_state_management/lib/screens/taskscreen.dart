import 'package:flutter/material.dart';
import 'package:todo_state_management/widgets/task_list.dart';
import 'package:todo_state_management/screens/add_task_screen.dart';
import 'package:todo_state_management/model/task.dart';


class TaskScreen extends StatefulWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  State<TaskScreen> createState() => _TaskScreenState();
}

class _TaskScreenState extends State<TaskScreen> {

  List<Task> tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          child: const Icon(Icons.add),
          onPressed: (){
            showModalBottomSheet(context: context, builder: (context) => AddTaskScreen(
              callBack: (newTaskTitle){
                setState(() {
                  tasks.add(Task(taskName: newTaskTitle, isDone: false));
                });
                Navigator.pop(context);
              },
            ));
          }
      ),
      body: Column(
        children: [
          Container(
            padding:
                const EdgeInsets.only(left: 30, right: 30, top: 60, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 20,
                  child: Icon(
                    Icons.list,
                    size: 30,
                    color: Colors.green[200],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "ZahraToDo",
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 15),
                 Text(
                  "${tasks.length} Task",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child:  TaskList(tasks: tasks),
            ),
          ),
        ],
      ),
    );
  }
}




