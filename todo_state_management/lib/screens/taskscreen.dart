import 'package:flutter/material.dart';
import 'package:todo_state_management/widgets/task_list.dart';
import 'package:todo_state_management/screens/add_task_screen.dart';


class TaskScreen extends StatelessWidget {
  const TaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[300],
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green[300],
          child: const Icon(Icons.add),
          onPressed: (){
            showModalBottomSheet(context: context, builder: (context) => AddTaskScreen());
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
                const Text(
                  "15 Task",
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
              child: const TaskList(),
            ),
          ),
        ],
      ),
    );
  }
}




