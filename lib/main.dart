import 'package:flutter/material.dart';
import 'package:primer_proyecto/src/login/home_page.dart';
import 'package:primer_proyecto/src/login/info_page.dart';
import 'package:primer_proyecto/src/login/login_page.dart';
import 'package:primer_proyecto/src/login/registro_page.dart';
import 'package:primer_proyecto/src/utils/my_colors.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor:  MyColors.primaryColor
      ),
      title: "Sprit2",
      initialRoute: "home",
      routes: {
        'home': (BuildContext context) => HomePage(), 
        'login': (BuildContext context) => LoginPage(),
        'registro': (BuildContext context) => RegistroPage(),
        'info': (BuildContext context) => InfoPage()
      },
    );
  }
}
