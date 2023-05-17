import 'package:flutter/material.dart';
import 'package:sqflite_db/database_helper.dart';
import 'package:sqflite_db/tools.dart';

void main() {
  runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: SqfliteApp()),
  );
}

class SqfliteApp extends StatefulWidget {
  const SqfliteApp({Key? key}) : super(key: key);

  @override
  State<SqfliteApp> createState() => _SqfliteAppState();
}

class _SqfliteAppState extends State<SqfliteApp> {
  final _textController = TextEditingController();
  int? _selectedId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _textController,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () async {
          await DatabaseHelper.instance
              .add(Tools(name: _textController.text.trim()));
          print(_textController.text.trim());
          setState(() async {
            _selectedId!=null ? await DatabaseHelper.instance.update(Tools(name: _textController.text.trim() , id:_selectedId ) ,)
            :await DatabaseHelper.instance.add(Tools(name: _textController.text.trim()));
            _textController.clear();
          });
        },
      ),
      /*
      we don't know when data is ready from database so future builder is necessary
       */
      body: Center(
        child: FutureBuilder<List<Tools>>(
          future: DatabaseHelper.instance.getTools(),
          builder: (BuildContext context, AsyncSnapshot<List<Tools>> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                child: Text("loading......"),
              );
            }
            return snapshot.data!.isEmpty
                ? const Center(
                    child: Text("database is empty"),
                  )
                : ListView(
                    children: snapshot.data!
                        .map(
                          (tools) => Center(
                            child: ListTile(
                              onTap: () {
                                setState(() {
                                  _textController.text = tools.name;
                                  _selectedId = tools.id;
                                });
                              },
                              onLongPress: () {
                                setState(() {
                                  DatabaseHelper.instance.remove(tools.id!);
                                });
                              },
                              title: Text(tools.name),
                            ),
                          ),
                        )
                        .toList(),
                  );
          },
        ),
      ),
    );
  }
}
