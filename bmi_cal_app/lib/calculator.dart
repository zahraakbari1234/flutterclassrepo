
import 'package:bmi_cal_start/screens/input_page.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Calculator{
  final int height;
  final int weight;
  late double _bmi ;

  //gender and age can be regarded in result by adding some conditions
  final Gender? gender;
  final int? age ;

Calculator({this.gender, this.age, required this.height , required this.weight});



String CalculateBmi (){

  _bmi = (weight /pow( height/100 , 2) );
   return _bmi.toStringAsFixed(1); // 1 point
}

String GetDetails(){
  if(_bmi >= 25){
    return "شما اضافه وزن دارید و باید وزن خود را کم کنید";
  }else if(_bmi >= 18.5){
    return "شما وزن متناسبی دارید";
  }else{
    return "شما خیلی لاغر هستید خوش بحالتان";
  }
}

String GetResult(){
  if(_bmi >= 25){
    return "اضافه وزن";
  }else if(_bmi >= 18.5){
    return "متناسب";
  }else{
    return " لاغر";
  }

}


}

