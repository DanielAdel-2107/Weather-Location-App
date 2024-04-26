import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:weather_app/constant.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: background,
      ),
      home: HomeView(),
    );
  }
}
