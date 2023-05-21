import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final TextEditingController _controller = TextEditingController();
  String test_txt = '';

  void _post(){
    setState((){
      test_txt = _controller.text.trim();
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(child: Column(
        children: [
          Expanded(child:
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              color: Colors.grey[400],
              child:Center(
                child: Text(test_txt,style: TextStyle(
                  color: Colors.red
                ),),
              )
            ),
          ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0 , right :8.0 , top:8.0),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter',
                  suffixIcon: IconButton(
                    icon: Icon(Icons.clear),
                    onPressed: () {  },
                  )
                ),

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
                  MaterialButton(onPressed: _post,
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
