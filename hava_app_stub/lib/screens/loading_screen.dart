import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
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
  }

  void _getCurrentLocation() async{

    Position position = await _determinPosition();
    setState(() {
      _position = position ;
    });
    print(_position);

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
          },
          color: Colors.blue,
          child: Text("Get Location"),
        ),
      ),
    );
  }
}
