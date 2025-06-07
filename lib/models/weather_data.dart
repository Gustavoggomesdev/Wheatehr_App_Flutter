class Weather {
  final String description;
  final String icon;

  Weather({required this.description, required this.icon});

  factory Weather.fromJson(Map<String, dynamic> json) {
    return Weather(
      description: json['description'],
      icon: json['icon'],
    );
  }
}

class Main {
  final double temp;
  final double tempMin;
  final double tempMax;
  final int humidity;

  Main({
    required this.temp,
    required this.tempMin,
    required this.tempMax,
    required this.humidity,
  });

  factory Main.fromJson(Map<String, dynamic> json) {
    return Main(
      temp: json['temp'].toDouble(),
      tempMin: json['temp_min'].toDouble(),
      tempMax: json['temp_max'].toDouble(),
      humidity: json['humidity'],
    );
  }
}

class WeatherData {
  final String name;
  final Main main;
  final List<Weather> weather;
  final int dt;

  WeatherData({
    required this.name,
    required this.main,
    required this.weather,
    required this.dt,
  });

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      name: json['name'],
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List).map((e) => Weather.fromJson(e)).toList(),
      dt: json['dt'],
    );
  }
}