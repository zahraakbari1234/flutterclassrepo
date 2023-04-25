import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

//1 :      use SingleTickerProviderStateMixin  with stateful class
class _MyAppState extends State<MyApp> with SingleTickerProviderStateMixin {
  bool bookmark = false;
  //2:   make animation controller, init and dispose it
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 3));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          if (bookmark == false) {
            _controller.forward();
            bookmark = true;
          } else {
            _controller.reverse();
            bookmark = false;
          }
        },
        child: Center(
            child: Lottie.network(
                'https://assets4.lottiefiles.com/packages/lf20_xdfeea13.json',
                controller: _controller)),
      ),
    );
  }
}
