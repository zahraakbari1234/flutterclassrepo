import 'package:flutter/material.dart';
import 'package:hava_app_stub/screens/city_screen.dart';
import 'package:hava_app_stub/services/weather.dart';
import 'package:hava_app_stub/utilities/constants.dart';
import 'package:google_fonts/google_fonts.dart';










class LocationScreen extends StatefulWidget {
  LocationScreen({required this.locationWeather});
  final dynamic locationWeather;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();

  int Tempreture = 0;
  int condition = 0;
  String CityName = "";
  String weatherIcon = "";
  String weatherMessage = "";
  String ImageUrl = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.locationWeather);
    updateUi(widget.locationWeather);
  }

  void updateUi(dynamic weatherData) {
    setState(() {

    double temp = weatherData['main']['temp'];
    Tempreture = temp.toInt();
    condition = weatherData['weather'][0]['id'];
    CityName = weatherData['name'];

    weatherIcon = weather.getWeatherIcon(condition);
    weatherMessage = weather.getMessage(Tempreture);
    ImageUrl = weather.getImageUrl(condition);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/${ImageUrl}'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: const BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updateUi(weatherData);
                    },
                    child: const Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                  var TypedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                          if(TypedName !=null){
                            var weatherData = await weather.GetCityweather(TypedName);
                            print(weatherData);
                            updateUi(weatherData);
                            // var waetherData = await weather.
                          }
                    },
                    child: const Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 120),





              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: <Widget>[
                        Text(
                          '${Tempreture}°',
                          style: GoogleFonts.lato(
                            fontSize: 80,
                            fontWeight: FontWeight.bold,
                            color: Colors.white
                          ),
                        ),
                        Text(
                          '${weatherIcon}️',
                          style: kConditionTextStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '${CityName} ',
                      textAlign: TextAlign.right,
                      style: KCityLabelTextStyle,

                    ),
                  ],
                ),
              ),
              Text(
                weatherMessage,
                textAlign: TextAlign.center,
                style: kMessageTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
