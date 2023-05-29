import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:camera_app/camera_page.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),

      body: Center(
        child: ElevatedButton(
          onPressed: () async{
            await availableCameras().then((value) =>
                Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage(cameras: value,))));
          },
          child: Text("lauch camera",
          style: TextStyle(
            color: Colors.black
          ),
          ),
        ),
      ),
    );
  }
}