import 'package:flutter/material.dart';
import 'package:hava_app_stub/utilities/constants.dart';

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String City_name ="";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,

          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              // Align(
              //   alignment: Alignment.topLeft,
              //   child: FlatButton(
              //     onPressed: () {
              //       Navigator.pop(context , City_name);
              //     },
              //     child: Icon(
              //       Icons.arrow_back_ios,
              //       size: 50.0,
              //     ),
              //   ),
              // ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  style: TextStyle(color: Colors.black),
                  decoration: KTextFieldInputDecordation,
                  onChanged: (value){
                    City_name = value;
                  },
                ),
              ),
              // FlatButton(
              //   onPressed: () {},
              //   child: Text(
              //     'Get Weather',
              //     style: kButtonTextStyle,
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
