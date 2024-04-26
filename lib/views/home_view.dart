import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/get_position.dart';
import 'package:weather_app/services/get_weather.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  var data;
  Position? position;
  getCurrentPosition() async {
    position = await GetPosition();
    setState(() {});
    data = Weather().getWeather(
        lat: "${position!.latitude}", lon: "${position!.longitude}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentPosition();
  }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
          child: FutureBuilder<WeatherModel>(
              future: data,
              builder: (context, snapchat) {
                if (snapchat.hasData) {
                  return ListView(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 20),
                        margin: EdgeInsets.only(right: 15, left: 15, top: 15),
                        height: size.height * 0.75,
                        width: size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                Color(0xff955cd1),
                                Color(0xff3fa2fa),
                              ],
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              stops: [0.2, 0.85]),
                          borderRadius: BorderRadius.circular(
                            40,
                          ),
                        ),
                        child: Column(
                          children: [
                            Text(
                              snapchat.data!.cityName,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 35,
                                fontFamily: "MavenPro",
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              snapchat.data!.cityName,
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.9),
                                fontSize: 16,
                                fontFamily: "MavenPro",
                              ),
                            ),
                            Image.network(
                              'https:${snapchat.data!.icon}',
                              height: size.height * 0.2,
                              fit: BoxFit.cover,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '${snapchat.data!.condition}',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 35,
                                fontWeight: FontWeight.w500,
                                fontFamily: "Hubballi",
                              ),
                            ),
                            Text(
                              '${snapchat.data!.temp}',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w800,
                                fontSize: 75,
                                fontFamily: "Hubballi",
                              ),
                            ),
                            Expanded(
                              child: Container(),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/windy.png',
                                        width: size.width * 0.17,
                                      ),
                                      Text(
                                        '${snapchat.data!.wind} Km/h',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Hubballi",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'wind',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "MavenPro",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/Humidity.png',
                                        width: size.width * 0.17,
                                      ),
                                      Text(
                                        '${snapchat.data!.humidity}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Hubballi",
                                        ),
                                      ),
                                      // 01005793023
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Humidity',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "MavenPro",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'Assets/Images/wind_diriction.png',
                                        width: size.width * 0.17,
                                      ),
                                      Text(
                                        '${snapchat.data!.windDirection}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "Hubballi",
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'wind diriction',
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.6),
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "MavenPro",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Container(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Gust',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapchat.data!.gust} Kp/h',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Pressure',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapchat.data!.pressure} hpa',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'UV',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapchat.data!.uv}',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Precipitation',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapchat.data!.principe} mm',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'Wind',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapchat.data!.wind} Km/h',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 23,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Last update',
                                  style: TextStyle(
                                    color: Colors.white.withOpacity(0.5),
                                    fontSize: 17,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${snapchat.data!.lastUpdate}',
                                  style: TextStyle(
                                    color: Colors.green,
                                    fontSize: 14,
                                    fontFamily: "MavenPro",
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  );
                } else {
                  return Center(
                      child: CircularProgressIndicator(
                    color: Colors.white,
                  ));
                }
              })),
    );
  }
}
