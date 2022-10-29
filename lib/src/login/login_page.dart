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
            'assets/img/logo_ms.jpeg',
            width: 200,
            height: 200,
            ),
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(),  
                  labelText: 'Correo Electronico',
              ),
              onChanged: ( value ) {
              
              },
            ),
            
          ),
          Divider(),

          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
              onChanged: ( value ) {
              
              },
            ),
            
          ),
                Divider(),
          Container(
          child:  ElevatedButton(
          child: Text("Iniciar Sección"),
          style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            elevation: 0,
          ),
          onPressed: () => Navigator.pushNamed(context, 'info')
        )
            ),
        Container(child: 
        GestureDetector(
          child: Text("Registrate", style: TextStyle(decoration: TextDecoration.underline, color: Colors.blue)),
              onTap: () => Navigator.pushNamed(context, 'registro')
)
        )  
        
        ],
      ) 
  )
    );
  }
}