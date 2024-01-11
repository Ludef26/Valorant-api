import 'package:flutter/material.dart';

class DatosPersonajes extends StatefulWidget {
  const DatosPersonajes({super.key});

  @override
  State<DatosPersonajes> createState() => _DatosPersonajesState();
}

class _DatosPersonajesState extends State<DatosPersonajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Datos Personajes'),
      ),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
