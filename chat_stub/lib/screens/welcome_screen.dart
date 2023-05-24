import 'package:flutter/material.dart';
import 'package:chat_stub/screens/chat_screen.dart';
import 'package:chat_stub/screens/login_screen.dart';
import 'package:chat_stub/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_stub/widgets/rounded_btn.dart';


class WelcomeScreen extends StatefulWidget {
  String id = "welcome_screen";
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;




  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(vsync: this, duration: Duration(seconds: 5));
    // controller.reverse( from:  1);
    animation = ColorTween(begin: Colors.blueAccent, end: Colors.deepPurple)
        .animate(controller);
    controller.forward();

    // animation.addStatusListener((status) {
    //
    //   if(status ==AnimationStatus.completed){
    //     controller.reverse(from:  1
    //     );
    //   }
    //
    //   else if (status ==AnimationStatus.dismissed){
    //     controller.forward();
    //   }
    // });

    // controller.addListener(() {
    //   print(controller.value);
    //   setState(() {});
    // });
  }


  @override
  void dispose() {
    controller.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 100,
                  ),
                ),
              Text("ChatApp",style: TextStyle(
                fontSize: 45,
                fontWeight: FontWeight.w900
              )),
              // TypewriterAnimatedTextKit(text: ["ChatApp"], textStyle: TextStyle(
              //   fontSize: 45,
              //   fontWeight: FontWeight.w900
              // )),
              ],
            ),
            SizedBox(
              height: 48.0,
            ),
            RoundedButton(title: 'login', color: Colors.green[300]!,onpress: (){

              Navigator.pushNamed(context, LoginScreen().id);
            }),
            RoundedButton(title: 'Register', color: Colors.red, onpress: (){
              Navigator.pushNamed(context, RegistrationScreen().id);
            })
          ],
        ),
      ),
    );
  }
}


