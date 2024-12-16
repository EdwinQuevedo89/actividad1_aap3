  // ignore_for_file: no_leading_underscores_for_local_identifiers

  import 'package:deber_dos/screens/guardar_screen.dart';
  import 'package:deber_dos/screens/register_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'package:firebase_auth/firebase_auth.dart';


  class Login extends StatelessWidget {
    const Login({super.key});

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: Text("Login")),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
        child: formularioLogin(context)
        ),
        
      );
    }

    Widget formularioLogin( context) {
      TextEditingController _email = TextEditingController();
      TextEditingController _pass = TextEditingController();

      return Column(
          children: [
            TextField(
              controller: _email,
              decoration: const InputDecoration(labelText: 'Correo electrónico'),
            ),
            // Campo para la contraseña


            TextField(
              controller: _pass,
              decoration: const InputDecoration(labelText: 'Contraseña'),
            ),

            // Botón de Login utilizando FilledButton
            FilledButton(
              onPressed: () {  
                login(_email.text, _pass.text, context);
              },child: Text("Login")),
          ],
        );
    
    }
  }

  Future<void> login (email, pass, context) async {
  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email, 
      password: pass
      );
  Navigator.push(context,MaterialPageRoute(builder: (context)=>Guardar()));

  } on FirebaseAuthException catch (e) {
    if (e.code == 'user-not-found') {
      print('No user found for that email.');
    } else if (e.code == 'wrong-password') {
      print('Wrong password provided for that user.');
    }
  }
  }
