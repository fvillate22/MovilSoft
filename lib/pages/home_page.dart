import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:libros/pages/fullscreenmap.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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
              "Monserrate",
              style: TextStyle(fontSize: 30),
              ),   
          ),
          Container(
            alignment: Alignment.center,
            child: Image.asset( 
            'assets/images/mon.png',
            width: 200,
            height: 200,
            ),      
          ),
          Container(
            alignment: Alignment.center,
            child: Column(
              children: const<Widget>[
                  Text("Ciudad: Bogota", textAlign: TextAlign.justify),
                  Divider(),
                  Text("Departamento: Distrito Capital", textAlign: TextAlign.justify,),
                  Divider(),
                  Text("Temperatura: 10", textAlign: TextAlign.justify,),
                  Divider(),
                  Text("Al levantar la mirada desde cualquier punto de la ciudad, es imposible no toparse con aquel Cerro que desde sus 3.152 metros a nivel del mar, vigila a Bogotá", textAlign: TextAlign.justify,)
              ],
            ),
            
          ),    
          Container(
            alignment: Alignment.center,
            child:    ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 16)),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder:(context) => const FullScreenMap()));
                    },
                    child: const Text('Mapa')),
          )
        ],
      )

    );
  }
}