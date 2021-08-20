class WeatherModel {
  final double lat;
  final double lon;
  final double temp;
  final double feelsLike;
  final int pressure;
  final int humidity;
  final double dewPoint;
  final double uvi;
  final int clouds;
  final int visibility;
  final double windSpeed;
  final int windDeg;
  final double windGust;
  final List<String> properties = [];

  WeatherModel.fromJson(Map<String, dynamic> parsedJson)
      : lat = parsedJson['lat'],
        lon = parsedJson['lon'],
        temp = parsedJson['current']['temp'],
        feelsLike = parsedJson['current']['feels_like'],
        pressure = parsedJson['current']['pressure'],
        humidity = parsedJson['current']['humidity'],
        dewPoint = parsedJson['current']['dew_point'],
        uvi = parsedJson['current']['uvi'].toDouble(),
        clouds = parsedJson['current']['clouds'],
        visibility = parsedJson['current']['visibility'],
        windSpeed = parsedJson['current']['wind_speed'],
        windDeg = parsedJson['current']['wind_deg'],
        windGust = parsedJson['current']['wind_gust'];

  // Create a list of all keys from parsedJson
  // void createPropertyList(Map<String, dynamic> myMap) {
  //   for (var key in myMap.keys) {
  //     if (myMap[key] is Map) {
  //       createPropertyList(myMap[key]);
  //     }

  //     properties.add(key);
  //   }
  // }

}
