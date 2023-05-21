import 'package:flutter/material.dart';
import 'package:sticky_note/googlesheet_api.dart';
import 'note_grid.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _controller = TextEditingController();


  Future<void> _post() async {
    await GoogleSheetApi.insert(_controller.text.trim());
    setState(()  {
    });
  }

  void startLoading(){
    Timer.periodic(Duration(seconds: 1), (timer) {
      if(GoogleSheetApi.loading == false){
        setState(() {

        });
      }

    });
  }

  @override
  void initState() {
    super.initState();

    //listen to the set-state and update according to its state
    _controller.addListener(() {setState(() {});
    });

  }


  @override
  Widget build(BuildContext context) {


    //while loading is running do the startLoading function
    if(GoogleSheetApi.loading==true){
      startLoading();
    }



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
          NoteGrid(),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {},
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('post sth'),
                MaterialButton(
                  onPressed: _post,
                  color: Colors.green,
                  child: const Text("post"),
                ),
              ],
            ),
          )
        ],
      )),
    );
  }
}
