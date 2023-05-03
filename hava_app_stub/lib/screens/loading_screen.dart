import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http ; // just giving a name

// import 'package:hava_app_stub/screens/location_screen.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:hava_app_stub/services/location.dart';
import 'package:hava_app_stub/services/networking.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:hava_app_stub/services/weather.dart';

const api_key = 'cbfd8f846200afc7d1bf9a44a8d0dfe0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double? longitude = 0.0;
  double latitude = 0.0;


  @override
  void initState() {
    super.initState();
    getLocation();
  }

 void getLocation() async{
    Location location = Location();

    await location.getCurrentLocation();
    longitude = location.longitude;
    latitude = location.latitude;

    NetworkHelper networkHelper = NetworkHelper( url: "https://api.openweathermap.org/data/2.5/weather?lat=${latitude}&lon=${longitude}&appid=$api_key");
    var weatherData = await networkHelper.getData();
    print(weatherData);
    // print(longitude);
    // print(latitude);

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            getLocation();
            },
          color: Colors.blue,
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
