import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:libros/models/user.dart';
import 'package:libros/pages/login_page.dart';
import 'package:libros/repository/firebase_api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

enum Genre { masculino, femenino }

class _RegisterPageState extends State<RegisterPage> {
  final FirebaseApi _firebaseApi = FirebaseApi();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _clave = TextEditingController();
  final _repetirclave = TextEditingController();
  String _data = "";
  Genre? _genre = Genre.masculino;
  bool _aventura = false;
  bool _fantasia = false;
  bool _terror = false;
  String buttonMsg = "fecha de nacimiento";

  //DateTime _dateTime = DateTime(2022, 1, 1);
  String _dateTime = " ";

  String _dateConvert(DateTime newDate) {
    final DateFormat formato = DateFormat('yyyy-MM-dd');
    final String dateformat = formato.format(newDate);
    return dateformat;
  }

  void _showSelectDate() async {
    final DateTime? newDate = await showDatePicker(
        context: context,
        locale: const Locale("es", "CO"),
        initialDate: DateTime(2022, 8),
        firstDate: DateTime(1900, 1),
        lastDate: DateTime(2022, 12),
        helpText: "fecha de nacimiento");

    if (newDate != null) {
      setState(() {
        _dateTime = _dateConvert(newDate);
        buttonMsg = "fecha de nacimiento: ${_dateTime.toString()}";
      });
    }
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

  void _saveUser(User user) async {
    var result = await _firebaseApi.createUser(user);
    Navigator.pushReplacement(context, MaterialPageRoute(builder:(context) => LoginPage()));

  }

  void _registerUser(User user) async {
    //SharedPreferences preferences  = await SharedPreferences.getInstance();
    //preferences.setString("user", jsonEncode(user));
    var result = await _firebaseApi.registerUser(user.email, user.password);
    String msg = "";
    if (result == "invalid-email") {
      msg = "El correo electronico no es corecto, verifique";
    } else if (result == "weak-password") {
      msg = " La clave debe tener minimo 6 digitos, verifique";
    } else if (result == "email-already-in-use") {
      msg = " El coreo ingresado ya existe, verifique";
    } else if (result == " network-request-failed") {
      msg = " Revise su conexión de Internet";
    } else{
      msg = "Usuario Registrado con Exito";
      user.uid = result;
      _saveUser(user);
    }
    _showMsg(msg);
  }

  void _onRegisterButtonClicked() {
    setState(() {
      if (_clave.text == _repetirclave.text) {
        String genre = "Masculino";
        if (_genre == Genre.femenino) {
          genre = "Femenino";
        }
        String favoritos = "";
        if (_aventura) {
          favoritos = "$favoritos Aventura";
        }

        if (_fantasia) {
          favoritos = "$favoritos Fantasia";
        }

        if (_terror) {
          favoritos = "$favoritos Terror";
        }
        /*_data = "Nombre: ${_name.text} \nCorreo electronico: ${_email.text}"
            "\nGenero: $genre \nFavoritos: $favoritos \nFecha de Nacimiento: $_dateTime ";
        _showMsg(_data);*/

        var user = User(
          "",
          _name.text,
          _email.text,
          _clave.text,
          _genre,
          favoritos,
          _dateTime

        );
        _registerUser(user);
        //Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      } else {
        _showMsg("las claves deben ser iguales ");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Image(image: AssetImage('assets/images/logo_ms.jpeg'),
                width: 100,
                height: 100,),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Nombre:',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _email,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Correo:',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _clave,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Clave:',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: _repetirclave,
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Repetir Clave:',
                  ),
                  keyboardType: TextInputType.text,
                ),
                const SizedBox(
                  height: 16,
                ),

                /*
                Row(
                  children: [
                    Expanded(
                      child: ListTile(
                        title: const Text('Masculino'),
                        leading: Radio<Genre>(
                            value: Genre.masculino,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            }),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        title: const Text('Femenino'),
                        leading: Radio<Genre>(
                            value: Genre.femenino,
                            groupValue: _genre,
                            onChanged: (Genre? value) {
                              setState(() {
                                _genre = value;
                              });
                            }),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Generos favoritos',
                  style: TextStyle(fontSize: 20),
                ),
                CheckboxListTile(
                  title: const Text('Aventura'),
                  value: _aventura,
                  onChanged: (bool? value) {
                    setState(() {});
                    _aventura = value!;
                  },
                ),
                CheckboxListTile(
                  title: const Text('Fantasia'),
                  value: _fantasia,
                  onChanged: (bool? value) {
                    setState(() {});
                    _fantasia = value!;
                  },
                ),
                CheckboxListTile(
                  title: const Text('Terror'),
                  value: _terror,
                  onChanged: (bool? value) {
                    setState(() {});
                    _terror = value!;
                  },
                ),
                
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      _showSelectDate();
                    },
                    child: Text(buttonMsg)),
*/
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      _onRegisterButtonClicked();
                    },
                    child: const Text('Registrar')),
                /*Text(
                  _data,
                  style: const TextStyle(
                      fontSize: 14, fontStyle: FontStyle.italic),
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
