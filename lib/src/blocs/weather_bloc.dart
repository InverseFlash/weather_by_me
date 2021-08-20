import 'package:rxdart/subjects.dart';
import 'package:weather_by_me/src/resources/repository.dart';
import '../models/weather_model.dart';
import '../models/location_model.dart';
import 'package:geolocator/geolocator.dart';

class WeatherBloc {
  final _repository = Repository();
  final _weatherStream = PublishSubject<WeatherModel>();
  final _locationStream = PublishSubject<LocationModel>();

  // Getters to sink
  Function(WeatherModel) get weatherSink => _weatherStream.sink.add;
  Function(LocationModel) get locationSink => _locationStream.sink.add;

  // Getters to stream output
  Stream<WeatherModel> get weatherStream => _weatherStream.stream;
  Stream<LocationModel> get locationStream => _locationStream.stream;

  void fetchLocationName(Position position) async {}

  Future<void> fetchWeather() async {
    final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final location = await _repository.fetchLocationName(
        position.latitude, position.longitude);
    final weather =
        await _repository.fetchWeather(position.latitude, position.longitude);

    _locationStream.sink.add(location);
    _weatherStream.sink.add(weather);
  }

  void dispose() {
    _weatherStream.close();
    _locationStream.close();
  }

  // final weatherBloc = WeatherBloc();
}
