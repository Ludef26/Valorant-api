import 'package:flutter/material.dart';

class DatosMapa extends StatefulWidget {
  const DatosMapa({super.key});

  @override
  State<DatosMapa> createState() => _DatosMapaState();
}

class _DatosMapaState extends State<DatosMapa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Datos Mapa'),
      ),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
