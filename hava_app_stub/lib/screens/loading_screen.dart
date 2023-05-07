import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:http/http.dart' as http ; // just giving a name

import 'package:hava_app_stub/screens/location_screen.dart';
// import 'dart:convert';
import 'package:hava_app_stub/services/location.dart';
import 'package:hava_app_stub/services/networking.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:hava_app_stub/services/weather.dart';
// import 'package:hava_app_stub/services/weather.dart';

const api_key = 'cbfd8f846200afc7d1bf9a44a8d0dfe0';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getLocation();
  }

 void getLocation() async{

    var weatherData = await WeatherModel().getLocationWeather();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherData,);

    }));

  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child:SpinKitSpinningLines(
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}


