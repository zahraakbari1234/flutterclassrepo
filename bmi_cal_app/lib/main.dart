import 'package:flutter/material.dart';
import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(

        scaffoldBackgroundColor: const Color(0XFF85937a),
        accentColor: const Color(0XFF586c5c),
        textTheme: const TextTheme(
          bodyText1: TextStyle(color:Color(0XFFdfdcb9)),
          bodyText2: TextStyle(color:Color(0XFFdfdcb9)),

        )
      ),
      home: InputPage(),
    );
  }
}

