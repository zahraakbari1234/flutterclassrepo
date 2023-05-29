import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:push_notification/home_page.dart';
import 'dart:async';
// import 'firebase_options.dart';


Future<void> backgroundHandler(RemoteMessage massege) async{
  print("this is a massege from background");
}



void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp;

    FirebaseApp app = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Initialized default app $app');


  FirebaseMessaging.onBackgroundMessage((backgroundHandler));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'push notif app',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  MyHomePage(),
    );
  }
}


class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
// TODO(Lyokone): Remove when FlutterFire CLI updated
      case TargetPlatform.windows:
        return android;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }


  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBRgcf1JyscZnAd9lnBTSC3HqaB7TCg5s8',
    appId: '1:599030371674:android:b51e051aaad58d42354f63',
    messagingSenderId: '599030371674',
    projectId: 'pushnotification-83db0',
    // databaseURL:
    // 'https://flutterfire-e2e-tests-default-rtdb.europe-west1.firebasedatabase.app',
     storageBucket: 'pushnotification-83db0.appspot.com',
  );
}