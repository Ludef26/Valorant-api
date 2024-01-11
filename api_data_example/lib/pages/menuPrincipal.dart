import 'package:flutter/material.dart';

// ignore: camel_case_types
class mainMenu extends StatefulWidget {
  const mainMenu({super.key});

  @override
  State<mainMenu> createState() => _mainMenuState();
}

// ignore: camel_case_types
class _mainMenuState extends State<mainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de MenuPrincipal'),
      ),
      body: Center(
          //Boton para pasar al menu de perosnajes
          child: ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(
              context, "Lista Personajes"); //Ruta para llegar al menu
        },
        child: const Text('Lista Personajes'), //Frase para el boton
      )),
    );
  }
}
