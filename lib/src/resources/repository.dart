import '../models/weather_model.dart';
import 'owm_api_provider.dart';
import '../models/location_model.dart';

class Repository {
  // Consults a single source (OpenWeatherMap) for weather and location data.
  // This will change in the future as other api provider classes (in resources
  // folder) implement the abstract classes.
  Future<WeatherModel> fetchWeather(double lat, double lon) {
    Future<WeatherModel> weatherModel;
    weatherModel = OpenWeatherMapApiProvider().fetchWeather(lat, lon);
    return weatherModel;
  }

  Future<LocationModel> fetchLocationName(double lat, double lon) {
    Future<LocationModel> locationModel;
    locationModel = OpenWeatherMapApiProvider().fetchLocationName(lat, lon);
    return locationModel;
  }
}

abstract class WeatherSource {
  Future<WeatherModel> fetchWeather(double lat, double lon);
}

abstract class ReverseGeocodeSource {
  Future<LocationModel> fetchLocationName(double lat, double lon);
}
