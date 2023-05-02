import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart'as http;
class NetworkHelper{

  final String url;
  NetworkHelper({required this.url});


  Future getData() async{
    http.Response response =
    await http.get(Uri.parse(url));
    // print(response.body);
    if (response.statusCode ==200){
      String data = response.body;

     var decodeDate = jsonDecode(data);
     return decodeDate;




    }
    else{
      print(response.statusCode);
    }

  }


}