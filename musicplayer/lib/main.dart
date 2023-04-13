import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const XylophoneApp());
}

class XylophoneApp extends StatelessWidget {


  const XylophoneApp({Key? key}) : super(key: key);

  void play ( int i){
    AudioCache player = AudioCache();
    player.play("note$i.wav");
  }

  Expanded buildKey({Color? color , int soundNumber = 1}){
    return Expanded(
      child: MaterialButton(
        onPressed: (){
          play(soundNumber);
        },
        color: color,
        child: const Text("play your music"),
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buildKey(color: Colors.amber , soundNumber: 1),
              buildKey(color: Colors.blue , soundNumber: 2),
              buildKey(color: Colors.pink , soundNumber: 3),
              buildKey(color: Colors.teal , soundNumber: 4),
              buildKey(color: Colors.deepPurple , soundNumber: 5),
              buildKey(color: Colors.orange , soundNumber: 6),
              buildKey(color: Colors.lightGreen , soundNumber: 7),
            ],
          ),
        ),
      ),
    );
  }
}

