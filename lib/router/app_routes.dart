import 'dart:html';

import 'package:flutter/material.dart';

import '../models/menu_option.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = 'splash';

  static final menuOptions = <MenuOption>[
    MenuOption(
      route: 'Guatape', 
      name: 'Guatape',
      screen: const InfoPage() ,
      icon:Icons.arrow_forward_ios_outlined),
    MenuOption(
      route: 'Monserrate', 
      name: 'Monserrate',
      screen: const HomePage() ,
      icon:Icons.arrow_forward_ios_outlined),   
    
  ];

static Map<String, Widget Function(BuildContext)> getAppRoutes(){
  Map<String, Widget Function(BuildContext)> AppRoutes = {};
  
  for (final options in menuOptions) {
    AppRoutes.addAll({options.route: (BuildContext context) => options.screen});
  }
  return AppRoutes;
}

/*
  static Map<String, Widget Function(BuildContext)> routes = {
        'splash': (BuildContext context) => SplashPage(),
        'home': (BuildContext context) => HomePage(), 
        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'info': (BuildContext context) => InfoPage(),
        'alert': (BuildContext context) => AlertScreen(),
        'card': (BuildContext context) => CardScreen(),
      };
 */
      static Route<dynamic> onGenerateRoute(RouteSettings Settings) {
        print(Settings);
        
        return MaterialPageRoute(builder: (context) => const SplashPage(),
        );
      }

      }