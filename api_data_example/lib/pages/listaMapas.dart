import 'package:flutter/material.dart';

class ListaMapas extends StatefulWidget {
  const ListaMapas({super.key});

  @override
  State<ListaMapas> createState() => _ListaMapasState();
}

class _ListaMapasState extends State<ListaMapas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Lista Mapas'),
      ),
      body: const Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}
