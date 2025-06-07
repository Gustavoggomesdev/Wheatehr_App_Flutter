import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

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
            value: false,
            onChanged: (value) {},
          ),
          ListTile(
            title: const Text('Unidades'),
            subtitle: const Text('Métrica (Celsius)'),
            onTap: () {},
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