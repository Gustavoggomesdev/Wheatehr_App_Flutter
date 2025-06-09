import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  final bool darkMode;
  final ValueChanged<bool> onDarkModeChanged;
  final String unit;
  final ValueChanged<String> onUnitChanged;

  const SettingsScreen({
    super.key,
    required this.darkMode,
    required this.onDarkModeChanged,
    required this.unit,
    required this.onUnitChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Modo Escuro'),
            value: darkMode,
            onChanged: onDarkModeChanged,
          ),
          ListTile(
            title: const Text('Unidades'),
            subtitle: Text(unit == 'metric' ? 'Métrica (Celsius)' : 'Imperial (Fahrenheit)'),
            onTap: () {
              onUnitChanged(unit == 'metric' ? 'imperial' : 'metric');
            },
          ),
          ListTile(
            title: const Text('Sobre'),
            onTap: () {
              Navigator.pushNamed(context, '/about');
            },
          ),
        ],
      ),
    );
  }
}