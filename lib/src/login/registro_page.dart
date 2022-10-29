import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_proyecto/src/utils/my_colors.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(
        title: Text("Registrar"),
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
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Repetir Password',
              ),
              onChanged: ( value ) {
              
              },
            ),
            
          ),
                Divider(),
          Container(
          child:  ElevatedButton(
          child: Text("Registrar"),
          style: ElevatedButton.styleFrom(
            primary: MyColors.primaryColor,
            elevation: 0,
          ),
          onPressed: () => Navigator.pushNamed(context, 'login')
        )
            ),
        
        
        ],
      ) 
  )
    );
  }
}