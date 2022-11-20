import 'package:flutter/material.dart';
import 'package:libros/models/menu_option.dart';
import 'package:libros/models/user.dart';
import 'package:libros/router/app_routes.dart';

class Listview1Screen extends StatelessWidget {
  const Listview1Screen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {

    final menuOptions = AppRoutes.menuOptions;

    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Lugares Turisticos'),
        backgroundColor: Colors.blueGrey,
      ),
      body: ListView.separated(
        itemBuilder: (context, i) =>   ListTile(
            title: Text(menuOptions[i].name),
            leading: Icon(menuOptions[i].icon),
            onTap: (){
              Navigator.pushNamed(context, menuOptions[i].route);
            },
          ),  
        separatorBuilder: (_, __) => const Divider(),
        itemCount: menuOptions.length)
    );
  }
}