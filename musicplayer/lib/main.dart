import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {

  static AudioCache player = AudioCache();

  const XylophoneApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: InkWell(
            onTap: (){
              player.play("note1.wav");
            },
            child: Container(
              height: 20,
              color: Colors.amber,
              child: Text("play"),
            ),
          ),
        ),
      ),
    );
  }
}

