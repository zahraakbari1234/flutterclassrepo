import 'package:chat_stub/screens/chat_screen.dart';
import 'package:chat_stub/widgets/rounded_btn.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:chat_stub/constants.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


class RegistrationScreen extends StatefulWidget {
  String id = "registration_screen";
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

  String email = "";
  String Password = "";
  final _auth = FirebaseAuth.instance;
  bool show_spinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: show_spinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Flexible(
                child: Hero(
                  tag: 'logo',
                  child: Container(
                    height: 300.0,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                  keyboardType: TextInputType.emailAddress,
                  textAlign: TextAlign.center,
                onChanged: (value) {
                    email = value;
                  //Do something with the user input.
                },
                decoration: kTxtfieldDecoration.copyWith(
                  hintText: "Enter your email"
                )
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                  textAlign: TextAlign.center,
                  obscureText: true,
                onChanged: (value) {
                    Password = value;
                  //Do something with the user input.
                },
                decoration: kTxtfieldDecoration.copyWith(
                  hintText: "Enter your password"
                )
              ),
              SizedBox(
                height: 24.0,
              ),
             RoundedButton(title: 'Register', color: Colors.green[300]!,
                 onpress:() async{
               setState(() {
                 show_spinner =true;
               });
               try {
                 final newUser = await _auth.createUserWithEmailAndPassword(
                     email: email, password: Password);
                 if (newUser != null) {
                   Navigator.pushNamed(context, ChatScreen().id);
                 }
                 setState(() {
                   show_spinner=false;
                 });
               }

               catch(e){
                 print(e);
               }

                 } ),

            ],
          ),
        ),
      ),
    );
  }
}
