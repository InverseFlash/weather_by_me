import 'package:http/http.dart';
import 'package:weather_by_me/src/models/location_model.dart';
import 'dart:convert' show json;
import '../models/weather_model.dart';
import 'repository.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class OpenWeatherMapApiProvider implements ReverseGeocodeSource, WeatherSource {
  String apiKey = dotenv.env['API_KEY'];

  final client = Client();

  @override
  Future<LocationModel> fetchLocationName(double lat, double lon) async {
    final uri = Uri.parse(
        'http://api.openweathermap.org/geo/1.0/reverse?lat=$lat&lon=$lon&limit=1&appid=$apiKey');
    final response = await client.get(uri);
    final parsedJson = json.decode(response.body);
    return LocationModel.fromJson(parsedJson);
  }

  @override
  Future<WeatherModel> fetchWeather(double lat, double lon) async {
    final uri = Uri.parse(
        'https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&units=metric&appid=$apiKey');
    final response = await client.get(uri);
    final parsedJson = json.decode(response.body);
    return WeatherModel.fromJson(parsedJson);
  }
}
