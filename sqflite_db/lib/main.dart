
import 'package:flutter/material.dart';
import 'package:sqflite_db/database_helper.dart';


void main() {
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       home:SqfliteApp()
     ),
  );
}


class SqfliteApp extends StatefulWidget {
  const SqfliteApp({Key? key}) : super(key: key);

  @override
  State<SqfliteApp> createState() => _SqfliteAppState();
}

class _SqfliteAppState extends State<SqfliteApp> {

  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textController,
        ),
      ),
      floatingActionButton:FloatingActionButton(
        child:Icon(Icons.add),
        onPressed:(){
          print(_textController.text.trim());
        },
      ),
      /*
      we dont know when data is ready from database so future builder is necessary
       */
      body:Center(
        child:FutureBuilder<List<Tools>>(
          future: DatabaseHelper.instance.getTools(),
          builder: (BuildContext context , AsyncSnapshot<List<Tools>> snapshot) => {

          },
        )
      )

    );
  }
}



