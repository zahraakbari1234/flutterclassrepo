import 'package:geolocator/geolocator.dart';

class Location {

  double? longitude = 0.0;
  double latitude = 0.0;
  late Position _position;


   Future<void> getCurrentLocation() async{
    Position position = await _determinPostion();
    _position = position;
    if(_position!=null){
      latitude = _position.latitude;
      longitude = _position.longitude;
    }
      // print(position);
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