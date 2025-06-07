import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/weather_data.dart';
import '../models/forecast_data.dart';

class WeatherService {
  static const String _apiKey = 'f37bf76c25e6705daa39130b2cc55fb7'; // Substitua pela sua API key
  static const String _baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<WeatherData> getCurrentWeather(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/weather?q=$city&appid=$_apiKey&units=metric&lang=pt'),
    );

    if (response.statusCode == 200) {
      return WeatherData.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load weather data');
    }
  }

  Future<List<ForecastData>> getForecast(String city) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/forecast?q=$city&appid=$_apiKey&units=metric&lang=pt'),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      return (data['list'] as List)
          .map((item) => ForecastData.fromJson(item))
          .toList();
    } else {
      throw Exception('Failed to load forecast data');
    }
  }
}