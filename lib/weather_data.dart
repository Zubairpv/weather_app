import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_app/weather_model.dart';

class weatherData {
  Future<Model> getData(var lattittude, var longitude) async {
    var urical = Uri.parse(
        'http://api.weatherapi.com/v1/current.json?key=fbe3727be200458abfe94212231704&q=$lattittude,$longitude&aqi=no');
    var response = await http.get(urical);
    var body = jsonDecode(response.body);
    return Model.fromJson(body);
  }
}
