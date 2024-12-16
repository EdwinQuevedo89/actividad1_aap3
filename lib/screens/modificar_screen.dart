import 'package:flutter/material.dart';

class ModificarScreen extends StatelessWidget {
  const ModificarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Modificar")),
      body: const Center(
        child: Text(
          'Aquí podrás modificar los datos.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
