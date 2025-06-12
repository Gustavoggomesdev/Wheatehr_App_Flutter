import 'package:flutter/material.dart';
import './screens/home_screen.dart';
import './screens/forecast_screen.dart';
import './screens/location_screen.dart';
import './screens/settings_screen.dart';
import './screens/about_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('pt_BR', null);
  runApp(const MyAppRoot());
}

class MyAppRoot extends StatefulWidget {
  const MyAppRoot({super.key});

  @override
  State<MyAppRoot> createState() => _MyAppRootState();
}

class _MyAppRootState extends State<MyAppRoot> {
  bool _darkMode = false;
  String _unit = 'metric'; 

  void _toggleDarkMode(bool value) {
    setState(() {
      _darkMode = value;
    });
  }

  void _changeUnit(String unit) {
    setState(() {
      _unit = unit;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Weather App',
      theme: _darkMode
          ? ThemeData.dark().copyWith(primaryColor: Colors.blue)
          : ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => HomeScreen(unit: _unit),
        '/location': (context) => const LocationScreen(),
        '/settings': (context) => SettingsScreen(
              darkMode: _darkMode,
              onDarkModeChanged: _toggleDarkMode,
              unit: _unit,
              onUnitChanged: _changeUnit,
            ),
        '/about': (context) => const AboutScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == '/forecast') {
          final city = settings.arguments as String? ?? 'São Paulo';
          return MaterialPageRoute(
            builder: (context) => ForecastScreen(unit: _unit, city: city),
          );
        }
        return null;
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
