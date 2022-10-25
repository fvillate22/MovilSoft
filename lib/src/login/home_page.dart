import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:primer_proyecto/src/login/login_page.dart';
import 'package:primer_proyecto/src/utils/my_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Center(
        child: GestureDetector(
          onTap: () => Navigator.pushNamed(context, 'login'),
          child: Image.asset(
            'assets/img/logo_movilSoft.png',
            width: 200,
            height: 200,
          ),
        )
      )
    );
  }
}