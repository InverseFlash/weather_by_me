import 'package:flutter/material.dart';
import 'location_bloc.dart';
export 'location_bloc.dart';

class LocationProvider extends InheritedWidget {
  final LocationBloc bloc;

  LocationProvider({Key key, Widget child})
      : bloc = LocationBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(_) => true;

  static LocationBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<LocationProvider>())
        .bloc;
  }
}
