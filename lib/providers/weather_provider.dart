import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class WeatherProvider with ChangeNotifier {
  WeatherModel? _weather;
  final WeatherService _weatherService = WeatherService();
  String _cityName = "New York";

  WeatherModel? get weather => _weather;
  String get cityName => _cityName;

  void selectCity(String cityName) {
    _cityName = cityName;
    notifyListeners();
  }

  Future<void> getWeather(String cityName) async {
    try {
      _weather = await _weatherService.fetchWeather(cityName);
      notifyListeners();
    } catch (e) {
      print(e);
    }
  }
}
