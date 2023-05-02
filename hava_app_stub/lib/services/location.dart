

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class Location {

  double? longitude = 0.0;
  double latitude = 0.0;
  late Position _postion;


   Future<void> getCurrentLocation() async{
    Position postion = await _determinPostion();
    _postion = postion;
    if(_postion!=null){
      latitude = _postion.latitude;
      longitude = _postion.longitude;
    }
      print(postion);
  }
  Future<Position> _determinPostion() async{
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
      if(permission == LocationPermission.denied){
        return Future.error(" Location permistions are denied");
      }
    }
    return await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
  }





}