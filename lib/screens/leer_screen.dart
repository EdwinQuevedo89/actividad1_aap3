import 'package:flutter/material.dart';

class Leer extends StatelessWidget {
  const Leer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Leer")),
      body: const Center(
        child: Text(
          'Aquí se mostrarán los datos leídos', 
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
