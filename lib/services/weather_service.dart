import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final String apiKey = dotenv.env["API_KEY"]!;
  final String baseUrl = "https://api.openweathermap.org/data/2.5/weather";

  Future<WeatherModel> fetchWeather(String cityName) async {
    final url = Uri.parse("$baseUrl?q=$cityName&appid=$apiKey&units=metric");

    final response = await http.get(url);

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      return WeatherModel.fromJson(data);
    } else {
      throw Exception("Failed to load weather data");
    }
  }
}
