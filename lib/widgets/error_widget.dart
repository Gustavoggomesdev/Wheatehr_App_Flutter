import 'package:flutter/material.dart';

class ErrorWidgetCustom extends StatelessWidget {
  final String error;
  
  const ErrorWidgetCustom({super.key, required this.error});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            color: Colors.white,
            size: 48,
          ),
          const SizedBox(height: 16),
          const Text(
            'Ocorreu um erro!',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Text(
              error,
              style: const TextStyle(color: Colors.white70),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              // Recarregar a tela ou tentar novamente
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}