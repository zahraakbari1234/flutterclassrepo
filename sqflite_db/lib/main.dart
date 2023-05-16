import 'package:flutter/material.dart';

void main() {
  runApp(
     MaterialApp(
       debugShowCheckedModeBanner: false,
       home:SqfliteApp()
     ),
  );
}


class SqfliteApp extends StatefulWidget {
  const SqfliteApp({Key? key}) : super(key: key);

  @override
  State<SqfliteApp> createState() => _SqfliteAppState();
}

class _SqfliteAppState extends State<SqfliteApp> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
