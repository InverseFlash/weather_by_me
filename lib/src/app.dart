import 'package:flutter/material.dart';
import 'package:weather_by_me/src/blocs/weather_provider.dart';
import 'package:weather_by_me/src/blocs/location_provider.dart';
import 'screens/weather_main.dart';
import 'screens/landing_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LocationProvider(
      child: WeatherProvider(
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          onGenerateRoute: routes,
        ),
      ),
    );
  }
}

Route routes(RouteSettings settings) {
  return MaterialPageRoute(
    builder: (context) {
      final weatherBloc = WeatherProvider.of(context);
      final locationBloc = LocationProvider.of(context);

      locationBloc
          .requestLocationPermissions()
          .then((_) => weatherBloc.fetchWeather());

      return WeatherMain();
    },
  );
}
