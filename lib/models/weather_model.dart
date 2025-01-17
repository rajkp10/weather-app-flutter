import "package:intl/intl.dart";

class WeatherModel {
  final String cityName;
  final String icon;
  final double temperature;
  final String description;
  final double feelsLike;
  final double wind;
  final int humidity;

  WeatherModel({
    required this.cityName,
    required this.icon,
    required this.temperature,
    required this.description,
    required this.feelsLike,
    required this.wind,
    required this.humidity,
  });

  factory WeatherModel.fromJson(Map<String, dynamic> json) {
    return WeatherModel(
        cityName: json["name"],
        icon: "http://openweathermap.org/img/wn/" +
            json["weather"][0]["icon"] +
            "@2x.png",
        temperature: json["main"]["temp"],
        description: json["weather"][0]["description"],
        feelsLike: json["main"]["feels_like"],
        wind: json["wind"]["speed"].toDouble(),
        humidity: json["main"]["humidity"]);
  }
}
