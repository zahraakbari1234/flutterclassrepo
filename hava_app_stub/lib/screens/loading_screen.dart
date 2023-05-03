import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http ; // just giving a name

// import 'package:hava_app_stub/screens/location_screen.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:hava_app_stub/services/location.dart';
// import 'package:hava_app_stub/services/networking.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:hava_app_stub/services/weather.dart';

// const api_key = '7863fcfa97fb15bab2ed87005549acf4';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  Position? _position;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    getData();
  }

  void _getCurrentLocation() async{

    Position position = await _determinPosition();
    setState(() {
      _position = position ;
    });
    print(_position);

  }


  void getData() async{
    http.Response response =
    await http.get(Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=London&appid=cbfd8f846200afc7d1bf9a44a8d0dfe0"));

    if ( response.statusCode == 200){
      String data = response.body;

      var weatherDescription = jsonDecode(data)['weather'][0]['description'];
      print(weatherDescription);

    }else{
      print(response.statusCode);
    }

  }




  Future<Position> _determinPosition() async {
    LocationPermission permission ;
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error("location permissions are denied");
      }
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(
          onPressed: () {
            _getCurrentLocation();
            getData();
          },
          color: Colors.blue,
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
