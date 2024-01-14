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
        // Botón para pasar al menú de personajes
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, "Lista Personajes",
                ); // Ruta para llegar al menú de personajes
              },
              child: const Text('Lista Personajes'), // Frase para el botón
            ),
            SizedBox(height: 20), // Espacio entre botones
            // Botón para pasar a la lista de mapas
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                  context, "Lista Mapas",
                ); // Ruta para llegar a la lista de mapas
              },
              child: const Text('Lista Mapas'), // Frase para el botón
            ),
          ],
        ),
      ),
    );
  }
}