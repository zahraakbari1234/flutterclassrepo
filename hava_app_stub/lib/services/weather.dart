import 'package:hava_app_stub/services/location.dart';
import 'package:hava_app_stub/services/networking.dart';
const api_key ='7863fcfa97fb15bab2ed87005549acf4';
const openWetherMapURL =  'https://api.openweathermap.org/data/2.5/weather';



class WeatherModel {






  Future<dynamic> GetCityweather(String CityName) async{
    var url = '${openWetherMapURL}?q=${CityName}&appid=${api_key}&units=metric';
    NetworkHelper networkHelper = await NetworkHelper(url: url);
    var weatherData = networkHelper.getData();
    print(weatherData);
    return weatherData;
  }


  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(
        url: '${openWetherMapURL}?lat=${location
            .latitude}&lon=${location.longitude}&appid=${api_key}&units=metric');
    var weatherData = await networkHelper.getData();
    // print(weatherData);
    return weatherData;
  }



String getImageUrl(int condition){
  if (condition < 300) {
    return 'Thunderstorm.jpg';
  } else if (condition < 400) {
    return 'heavyRain.jpg';
  } else if (condition < 600) {
    return 'lightRain.jpg';
  } else if (condition < 700) {
    return 'snow.jpg';
  } else if (condition < 800) {
    return 'fog.jpg';
  } else if (condition == 800) {
    return 'clearSky.jpg';
  } else if (condition <= 804) {
    return 'clouds.jpg';
  } else {
    return '🤷‍';
  }


}


  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';

    }
  }
}
