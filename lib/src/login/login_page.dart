import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:primer_proyecto/src/utils/my_colors.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Container( 
        width: double.infinity,
        child: 
    Column( 
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset( 
            'assets/img/logo_movilSoft.png',
            width: 200,
            height: 200,
            ),
          TextFormField(
            autofocus: true,
            initialValue: '',
            textCapitalization: TextCapitalization.words,
            onChanged: (value){
              print('value: $value');
            },
          )
        ],
      ) 
   )
    );
  }
}