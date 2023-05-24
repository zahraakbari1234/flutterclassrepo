import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:rive/rive.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'rive_animation',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(title: 'R A T E  M E'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller for playback
  late RiveAnimationController _controller;

  /// Is the animation currently playing?
  bool _isPlaying = false;

  // double _rating = 5;
  // String cuttentAnimation = '5+';

  // void _onChanged(double value) {
  //   setState(() {
  //     _rating = value;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    _controller = OneShotAnimation(
      'bounce',
      autoplay: false,
      onStop: () => setState(() => _isPlaying = false),
      onStart: () => setState(() => _isPlaying = true),
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RiveAnimation.asset(
          'assets/truck.riv',
          animations: const ['idle', 'curves'],
          controllers: [_controller],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        // disable the button while playing the animation
        onPressed: () => _isPlaying ? null : _controller.isActive = true,
        tooltip: 'Play',
        child: const Icon(Icons.arrow_upward),
      ),

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Container(
      //         height: 300,
      //         width: 300,
              // child: FlareActor("assets/happiness_emoji.flr",
              // alignment: Alignment.center,
              //   fit: BoxFit.contain,
              //   animation: cuttentAnimation,
              // ),
            // ),
            // Slider(
            //     min: 1,
            //     max: 5,
            //     divisions: 4,
            //     value: _rating,
            //     onChanged: _onChanged),
            // Text('$_rating'),
      //     ],
      //   ),
      // ),
    );
  }
}
