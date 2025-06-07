import 'weather_data.dart'; // Importa as classes Main e Weather

class ForecastData {
  final int dt;
  final Main main;
  final List<Weather> weather;

  ForecastData({
    required this.dt,
    required this.main,
    required this.weather,
  });

  factory ForecastData.fromJson(Map<String, dynamic> json) {
    return ForecastData(
      dt: json['dt'],
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
    );
  }
}