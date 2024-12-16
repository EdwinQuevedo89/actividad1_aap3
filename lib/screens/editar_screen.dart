import 'package:flutter/material.dart';

class EditarScreen extends StatelessWidget {
  const EditarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Editar")),
      body: const Center(
        child: Text(
          'Aquí podrás editar los datos.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}