import 'package:flutter/material.dart';
import 'package:gsheets/gsheets.dart';
import 'package:expense_tracker/home_page.dart';
import 'package:expense_tracker/google_sheet.dart';



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  GoogleSheetApi.init();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HomePage();

  }
}

