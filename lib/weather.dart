import 'networking.dart';
import 'location.dart';


const String apiKey = '0776fe7e405d2425a7ef5c98f249e90e';


class WeatherModel {

  Future <dynamic> getCityWeather(String cityName) async {
    NetworkHelper networkHelper = NetworkHelper(url:
    'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
    return weatherData;
  }


  Future <dynamic> getLocationWeather() async {
    Location location = Location();

    await location.getCurrentLocation();

    NetworkHelper networkHelper = NetworkHelper(url:
    'https://api.openweathermap.org/data/2.5/weather?lat=${location
        .lat}&lon=${location.long}&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData(); // = jsonDecode(data);
    return weatherData;
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
      return "It's 🍦 time";
    } else if (temp > 20) {
      return "Time for shorts and 👕";
    } else if (temp < 10) {
      return "You'll need 🧣 and 🧤";
    } else {
      return "Bring a 🧥 just in case";
    }
  }
}
