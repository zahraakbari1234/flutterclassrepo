import 'package:flutter/material.dart';
import 'package:wallet_ui_app/pages/home_page.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),

  ) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}
