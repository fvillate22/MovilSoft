import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:primer_proyecto/src/utils/my_colors.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({super.key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Detalle Sitio Turistico Piedra del Peñol"),
        backgroundColor: MyColors.primaryColor,
      ),
      body: Column(
        children: [
          Divider(),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Piedra del Peñol",
              style: TextStyle(fontSize: 30),
              ),   
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset( 
            'assets/img/guatape.png',
            width: 400,
            height: 400,
            ),      
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: const<Widget>[
                  Text("Ciudad: Medellin", textAlign: TextAlign.justify),
                  Divider(),
                  Text("Departamento: Antioquia", textAlign: TextAlign.justify,),
                  Divider(),
                  Text("Temperatura: 16", textAlign: TextAlign.justify,),
                  Divider(),
                  Text("Descripción: La Piedra del Peñol es una roca de granito gigante que se encuentra al sudoeste de la localidad y que dispone de una larga escalera hasta su cima, en la que se puede disfrutar de una vista panorámica de la zona.", textAlign: TextAlign.justify,)
              ],
            ),
            
          ),    
        ],
      )

    );
  }
}