import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:libros/models/user.dart';
import 'package:libros/pages/home_page.dart';
import 'package:libros/pages/register_page.dart';
import 'package:libros/repository/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:firebase_core/firebase_core.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _email = TextEditingController();
  final _password = TextEditingController();

  User userLoad = User.Empty();

  final FirebaseApi _firebaseApi = FirebaseApi();

  _getUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(prefs.getString("user")!);
    userLoad = User.FromJson(userMap);
  }

  void _showMsg(String msg) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
          content: Text(msg),
          action: SnackBarAction(
              label: 'Aceptar', onPressed: scaffold.hideCurrentSnackBar)),
    );
  }

  void _validateUser() async {
    if (_email.text == userLoad.email && _password.text == userLoad.password) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      var result = await _firebaseApi.registerUser(_email.text, _password.text);
      String msg = "";
      if (result == "invalid-email") {
        msg = "El correo electronico no es corecto, verifique";
      } else if (result == "weak-password") {
        msg = " La clave debe tener minimo 6 digitos, verifique";
      } else if (result == " network-request-failed") {
        msg = " Revise su conexión de Internet";
      } else {
        msg = "Bienvenido";
        _showMsg(msg);
        _showMsg("Usuario Registrado con Exito");
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      }
      _showMsg(msg);
      print(msg);

    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Image(
                image: AssetImage('assets/images/libros.png'),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Correo Electronico',
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Clave',
                ),
                keyboardType: TextInputType.visiblePassword,
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                  onPressed: () {
                    _validateUser();
                  },
                  child: Text('Iniciar Sesion')),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                    fontSize: 16,
                    fontStyle: FontStyle.italic,
                    color: Colors.blueAccent,
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RegisterPage()));
                },
                child: const Text('Registrarse'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
