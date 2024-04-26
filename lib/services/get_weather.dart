import 'package:dio/dio.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/models/weather_model.dart';

class Weather {
  Future<WeatherModel> getWeather({required var lat, required var lon}) async {
    Response response = await dio.get(
        'https://api.weatherapi.com/v1/current.json?key=9d3e102e8d9d4add869133432221903&q=$lat,$lon&aqi=no');
    Map<String, dynamic> jsonData = response.data;
    WeatherModel weather = WeatherModel.fromJson(jsonData);
    return weather;
  }
}
