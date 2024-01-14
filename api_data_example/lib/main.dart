import 'package:api_data_example/models/user.dart';
import 'package:api_data_example/pages/menuPrincipal.dart';

import 'package:api_data_example/pages/mapas.dart';
import 'package:api_data_example/pages/listaMapas.dart';

import 'package:api_data_example/pages/personajes.dart';
import 'package:api_data_example/pages/listaPersonajes.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const ApiDataLoadApp());
}

class ApiDataLoadApp extends StatelessWidget {
  const ApiDataLoadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Valorant',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //Rutas de las pantallas
      home: const MainMenu(),
      routes: {
        'mainMenu': (context) => const MainMenu(),
        'Lista Mapas': (context) => const ListaMapas(),
        'Lista Personajes': (context) => const ListaPersonajes(),
        'Datos Mapa': (context) => const DatosMapa(),
        'Datos Personajes': (context) {
          // Extrae el usuario de los argumentos de la ruta
          final user = ModalRoute.of(context)?.settings.arguments as User;
          return DatosPersonajes(user: user);
        },
      },
    );
  }
}
