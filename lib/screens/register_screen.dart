  import 'package:deber_dos/screens/guardar_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'package:firebase_auth/firebase_auth.dart';

  class RegisterScreen extends StatefulWidget {
    const RegisterScreen({super.key});

    @override
    _RegisterScreenState createState() => _RegisterScreenState();
  }

  class _RegisterScreenState extends State<RegisterScreen> {
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    final FirebaseAuth _auth = FirebaseAuth.instance;

    Future<void> _registerUser() async {
      try {
        final email = _emailController.text;
        final password = _passwordController.text;

        // Registro del usuario con correo y contraseña
        // ignore: unused_local_variable
        UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Si el registro es exitoso, redirigimos a la siguiente pantalla
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const Guardar()),
        );
      } on FirebaseAuthException catch (e) {
        // Manejamos errores comunes durante el registro
        if (e.code == 'email-already-in-use') {
          print('El correo electrónico ya está en uso.');
        } else if (e.code == 'weak-password') {
          print('La contraseña es demasiado débil.');
        } else {
          print('Error desconocido: ${e.message}');
        }
      }
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const Text("Registrarse")),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Correo electrónico'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _registerUser,
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      );
    }
  }

  Future<void> login(String email, String pass, BuildContext context) async {
    try {
      // Intentamos iniciar sesión con el correo y la contraseña
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: pass,
      );

      // Si el login es exitoso, redirigimos a la siguiente pantalla
      Navigator.push(context, MaterialPageRoute(builder: (context) => const Guardar()));
    } on FirebaseAuthException catch (e) {
      // Manejo de errores para login
      if (e.code == 'user-not-found') {
        print('No se encontró un usuario con ese correo electrónico.');
      } else if (e.code == 'wrong-password') {
        print('Contraseña incorrecta.');
      }
    }
  }

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(); // Inicializa Firebase
    runApp(MaterialApp(
      home: const RegisterScreen(),
    ));
  }
