import 'package:flutter/material.dart';
import 'package:chat_stub/screens/welcome_screen.dart';
import 'package:chat_stub/screens/login_screen.dart';
import 'package:chat_stub/screens/registration_screen.dart';
import 'package:chat_stub/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();

  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // home: WelcomeScreen(),
      initialRoute: WelcomeScreen().id,
      routes: {
        WelcomeScreen().id :(context)=>WelcomeScreen(),
        LoginScreen().id:(context)=>LoginScreen(),
        RegistrationScreen().id:(context)=>RegistrationScreen(),
        ChatScreen().id:(context)=>ChatScreen(),
      },
      // home: WelcomeScreen(),
    );
  }
}
