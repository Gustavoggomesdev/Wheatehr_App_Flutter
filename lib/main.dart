import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/forecast_screen.dart';
import './screens/location_screen.dart';
import './screens/settings_screen.dart';
import './screens/about_screen.dart';
import 'package:intl/date_symbol_data_local.dart'; // Adicione este import

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Garante inicialização do Flutter
  await initializeDateFormatting('pt_BR', null); // Inicializa para português do Brasil
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/forecast': (context) => const ForecastScreen(),
        '/location': (context) => const LocationScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/about': (context) => const AboutScreen(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}