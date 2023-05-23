import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_state_management/model/task_data.dart';
import 'package:todo_state_management/screens/taskscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
        ),
        home:  TaskScreen(),
      ),
    );
  }
}

