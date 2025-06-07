import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Erro")),
      body: Center(child: Text("Algo deu errado. Tente novamente!")),
    );
  }
}
