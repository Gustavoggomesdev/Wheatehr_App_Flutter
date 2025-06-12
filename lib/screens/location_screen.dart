import 'package:flutter/material.dart';

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escolher Localização'),
      ),
      body: ListView(
        children: [
          _buildLocationItem(context, 'São Paulo', 'SP'),
          _buildLocationItem(context, 'Rio de Janeiro', 'RJ'),
          _buildLocationItem(context, 'Belo Horizonte', 'MG'),
          _buildLocationItem(context, 'Brasília', 'DF'),
          _buildLocationItem(context, 'Curitiba', 'PR'),
          _buildLocationItem(context, 'Palmas', 'TO'),
          _buildLocationItem(context, 'Porto Alegre', 'RS'),
        ],
      ),
    );
  }

  Widget _buildLocationItem(BuildContext context, String city, String state) {
    return ListTile(
      title: Text(city),
      subtitle: Text(state),
      trailing: const Icon(Icons.chevron_right),
      onTap: () {
        Navigator.pop(context, city);
      },
    );
  }
}
