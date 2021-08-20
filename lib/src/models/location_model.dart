class LocationModel {
  String name;
  String country;

  LocationModel.fromJson(List<dynamic> parsedJson)
      : name = parsedJson[0]['name'],
        country = parsedJson[0]['country'];
}
