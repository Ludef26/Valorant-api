import 'package:flutter/material.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({Key? key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  final double _fontSize = 48.0; // Ajusta el tamaño inicial

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      body: Stack(
        children: [
          Positioned(
            top: 40,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                color: const Color.fromARGB(255, 189, 70, 62),
                padding: const EdgeInsets.all(10),
                child: Text(
                  'Valorant Agents',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: _fontSize,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            left: 0,
            width: 20,
            child: Container(
              color: const Color.fromARGB(255, 189, 70, 62),
            ),
          ),
          Positioned(
            top: 0,
            bottom: 0,
            right: 0,
            width: 20,
            child: Container(
              color: const Color.fromARGB(255, 189, 70, 62),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "Lista Personajes",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 189, 70, 62),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Lista Personajes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      "Lista Mapas",
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: const Color.fromARGB(255, 189, 70, 62),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                  ),
                  child: const Text(
                    'Lista Mapas',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
