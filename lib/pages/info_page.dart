import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:libros/pages/fullscreen1map.dart';


class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  State<InfoPage> createState() => _HomePageState();
}

class _HomePageState extends State<InfoPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Detalle Sitio Turistico Monserrate"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Divider(),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Guatape",
              style: TextStyle(fontSize: 30),
              ),   
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset( 
            'assets/images/guatape.png',
            width: 200,
            height: 200,
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
                  Text("Temperatura: 10", textAlign: TextAlign.justify,),
                  Divider(),
                  Text("Guatapé es un municipio de Colombia, localizado en la subregión Oriente del departamento de Antioquia", textAlign: TextAlign.justify,)
              ],
            ),
            
          ),    
          Container(
            alignment: Alignment.center,
            child:    ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const FullScreen1Map()));
                    },
                    child: const Text('Mapa')),
          )
        ],
      )

    );
  }
}