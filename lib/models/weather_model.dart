class WeatherModel {
  var cityName;
  var icon;
  var condition;
  var temp;
  var wind;
  var humidity;
  var windDirection;
  var gust;
  var uv;
  var pressure;
  var principe;
  var lastUpdate;
  WeatherModel(
      {required this.cityName,
      required this.icon,
      required this.condition,
      required this.temp,
      required this.wind,
      required this.humidity,
      required this.windDirection,
      required this.gust,
      required this.uv,
      required this.pressure,
      required this.principe,
      required this.lastUpdate});

  factory WeatherModel.fromJson(dynamic jsonData) {
    return WeatherModel(
      cityName: jsonData['location']['name'],
      icon: jsonData['current']['condition']['icon'],
      condition: jsonData['current']['condition']['text'],
      temp: jsonData['current']['temp_c'],
      wind: jsonData['current']['wind_kph'],
      humidity: jsonData['current']['humidity'],
      windDirection: jsonData['current']['wind_dir'],
      gust: jsonData['current']['gust_kph'],
      uv: jsonData['current']['uv'],
      pressure: jsonData['current']['pressure_mb'],
      principe: jsonData['current']['precip_mm'],
      lastUpdate: jsonData['current']['last_updated'],
    );
  }
}
