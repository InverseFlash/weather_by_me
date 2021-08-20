import 'package:flutter/material.dart';
import 'weather_bloc.dart';
export 'weather_bloc.dart';

class WeatherProvider extends InheritedWidget {
  final WeatherBloc bloc;

  WeatherProvider({Key key, Widget child})
      : bloc = WeatherBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static WeatherBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<WeatherProvider>()).bloc;
  }
}
