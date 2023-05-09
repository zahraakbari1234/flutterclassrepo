import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_start/user_page.dart';
import 'package:firebase_start/login_page.dart';

/*
android:


1_import core and auth
2_main() should be async
3_initializing      WidgetsFlutterBinding.ensureInitialized();  await Firebase.initializeApp(...);
4_find id in android/app/src/build.gradle  then copy and paste it in firebase
5_download jsonfield from firebase and paste it to android/app
6_add firebase sdk  ----> copy dependencies and paste it to android/gradle/build.gradle/dependencies
7_add the google service plugin to  android/app/src/build.gradle  -----> (id 'com.google.gms.google-services')
8_add implementation platform to build.gradle too like step7 in but in dependencies


 */

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(

    /*
    IDS are written in firebase project setting
     */
      name: 'firebase_start',
          options: const FirebaseOptions(
            apiKey: 'AIzaSyDukiPyRuOQoAQIyrMG9sA8IoracyrhZUY',
            appId: '1:176308687989:android:5357979f2a77b4f594d43c',
            messagingSenderId: '176308687989',
            projectId: 'fir-test-ff0d4',
          )
  );


  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body:LogInPage(),
    ),
  ));
}


