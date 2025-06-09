import 'package:flutter/material.dart';
import '../models/forecast_data.dart';
import '../services/weather_service.dart';
import '../widgets/forecast_item.dart';
import '../widgets/loading_widget.dart';
import '../widgets/error_widget.dart';
import '../widgets/empty_widget.dart';

class ForecastScreen extends StatefulWidget {
  final String unit;
  final String city;

  const ForecastScreen({super.key, required this.unit, required this.city});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  late Future<List<ForecastData>> _forecastFuture;

  @override
  void initState() {
    super.initState();
    _forecastFuture = WeatherService().getForecast(widget.city, unit: widget.unit);
  }

  void _refreshForecast() {
    setState(() {
      _forecastFuture = WeatherService().getForecast(widget.city, unit: widget.unit);
    });
  }

  @override
  void didUpdateWidget(covariant ForecastScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.unit != widget.unit || oldWidget.city != widget.city) {
      _refreshForecast();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Previsão para ${widget.city} (${widget.unit == "metric" ? "°C" : "°F"})'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refreshForecast,
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
        child: FutureBuilder<List<ForecastData>>(
          future: _forecastFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const LoadingWidget();
            } else if (snapshot.hasError) {
              return ErrorWidgetCustom(error: snapshot.error.toString());
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const EmptyWidget();
            } else {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return ForecastItem(forecast: snapshot.data![index]);
                },
              );
            }
          },
        ),
      ),
    );
  }
}

// Route configuratio