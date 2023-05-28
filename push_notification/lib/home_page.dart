import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String notificationMsg = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseMessaging.instance.getInitialMessage().then((event) {
      if(event != null){
        setState(() {

          notificationMsg = "${event.notification?.title} ${event.notification?.body} i am on terminated";

        });
      }

    });


    FirebaseMessaging.onMessageOpenedApp.listen((event) {
      setState(() {
        notificationMsg = "${event.notification?.title} ${event.notification?.body} i am from background";

      });
    });


    FirebaseMessaging.onMessage.listen((event) {
      setState(() {
        notificationMsg = "${event.notification?.title} ${event.notification?.body} i am from foreground";
      });

    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("firebase notification",
        style: TextStyle(
          color: Colors.white
        ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child:Text(notificationMsg)
      ),

    );
  }
}