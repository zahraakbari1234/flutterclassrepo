import 'package:flutter/material.dart';
import 'package:sticky_note/googlesheet_api.dart';
import 'note_grid.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();


  void _post() {
    setState(() {
      GoogleSheetApi.insert(_controller.text.trim());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[300],
        elevation:0,
        title: Center(
          child: Text(
            "P O S T   N O T E",
            style: TextStyle(
              color: Colors.grey[800],
            ),
          ),
        ),
      ),
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Column(
        children: [
          NoteGrid(
            text: _controller.text.trim(),
            numberOfNotes: 6,
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter',
                    suffixIcon: IconButton(
                      icon: Icon(Icons.clear),
                      onPressed: () {},
                    )),
              ),
            ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('post sth'),
                  MaterialButton(
                    onPressed: _post,
                    color: Colors.green,
                    child: Text("post"),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
