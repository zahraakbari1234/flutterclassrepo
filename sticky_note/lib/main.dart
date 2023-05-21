import 'package:flutter/material.dart';
import 'package:sticky_note/googlesheet_api.dart';
import 'package:sticky_note/home_page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetApi.init();

  runApp( MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const MyApp(),
    theme: ThemeData(
      primarySwatch: Colors.green
    ),
  ) );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const HomePage();
  }
}
