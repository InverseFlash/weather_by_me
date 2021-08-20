import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.horizontal,
      children: [
        Container(
          width: 100.0,
          height: 100.0,
        ),
        Container(
          width: 100.0,
          height: 100.0,
        ),
        Container(
          width: 100.0,
          height: 100.0,
        ),
      ],
    );
  }
}
