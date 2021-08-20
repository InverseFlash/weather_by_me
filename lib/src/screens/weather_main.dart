import 'package:flutter/material.dart';
import '../blocs/weather_provider.dart';
import '../blocs/location_provider.dart';
import '../models/weather_model.dart';
import '../models/location_model.dart';

class WeatherMain extends StatelessWidget {
  const WeatherMain({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final weatherBloc = WeatherProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: StreamBuilder(
          stream: weatherBloc.locationStream,
          builder: (context, AsyncSnapshot<LocationModel> snapshot) {
            if (!snapshot.hasData) {
              return Container();
            }
            return Center(
              child: Text(
                  '${snapshot.data.name.toUpperCase()} ${snapshot.data.country}'),
            );
          },
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await weatherBloc.fetchWeather();
        },
        child: StreamBuilder(
          stream: weatherBloc.weatherStream,
          builder: (context, AsyncSnapshot<WeatherModel> snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }
            return ListView(
              scrollDirection: Axis.vertical,
              children: [
                ListTile(
                  title: Text('Latitude'),
                  trailing: Text('${snapshot.data.lat}'),
                ),
                ListTile(
                  title: Text('Longitude: '),
                  trailing: Text('${snapshot.data.lon}'),
                ),
                ListTile(
                  title: Text('Current Temp: '),
                  trailing: Text('${snapshot.data.temp}'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // Widget weatherCard(context, WeatherModel currentWeather, color) {
  //   return Padding(
  //     padding:
  //         const EdgeInsets.only(top: 8.0, left: 8.0, bottom: 8.0, right: 8.0),
  //     child: Container(
  //         decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(30.0), color: color),
  //         width: MediaQuery.of(context).size.width - 16.0,
  //         child: Column(
  //           children: [Text('Paris, ON'), Text('${currentWeather.temp}')],
  //         )
  //         // color: color,
  //         ),
  //   );
  // }
}
