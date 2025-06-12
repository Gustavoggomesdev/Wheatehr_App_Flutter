import 'package:flutter/material.dart';
import '../models/weather_data.dart';
import '../services/weather_service.dart';
import '../widgets/weather_card.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/empty_widget.dart';

class HomeScreen extends StatefulWidget {
  final String unit;

  const HomeScreen({super.key, required this.unit});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final WeatherService _weatherService = WeatherService();
  late Future<WeatherData> _weatherFuture;
  String _city = 'São Paulo';

  @override
  void initState() {
    super.initState();
    _weatherFuture = _weatherService.getCurrentWeather(_city, unit: widget.unit);
  }

  void _refreshWeather() {
    setState(() {
      _weatherFuture = _weatherService.getCurrentWeather(_city, unit: widget.unit);
    });
  }

  @override
  void didUpdateWidget(HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.unit != widget.unit) {
      _refreshWeather();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather App'),
        actions: [
          IconButton(
            icon: const Icon(Icons.location_on),
            onPressed: () async {
              final selectedCity = await Navigator.pushNamed(context, '/location');
              if (selectedCity != null && selectedCity is String) {
                setState(() {
                  _city = selectedCity;
                  _weatherFuture = _weatherService.getCurrentWeather(_city, unit: widget.unit);
                });
              }
            },
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: FutureBuilder<WeatherData>(
          future: _weatherFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else if (snapshot.hasError) {
              return ErrorWidgetCustom(error: snapshot.error.toString());
            } else if (!snapshot.hasData) {
              return const EmptyWidget();
            } else {
              return WeatherCard(weatherData: snapshot.data!);
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _refreshWeather,
        child: const Icon(Icons.refresh),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Previsão',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Config',
          ),
        ],
        onTap: (index) {
          if (index == 1) {
            Navigator.pushNamed(context, '/forecast', arguments: _city);
          } else if (index == 2) {
            Navigator.pushNamed(context, '/settings');
          }
        },
      ),
    );
  }
}

