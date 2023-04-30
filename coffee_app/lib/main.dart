import 'package:flutter/material.dart';
import 'package:coffee_app/home_page.dart';

void main() {
  runApp( MaterialApp(
    theme: ThemeData(brightness: Brightness.dark,
    primarySwatch: Colors.orange
    ),
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

