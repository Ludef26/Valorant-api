import 'package:api_data_example/models/user.dart';
import 'package:flutter/material.dart';

class DatosPersonajes extends StatefulWidget {
  final User user; // Nuevo campo para almacenar el usuario seleccionado

  const DatosPersonajes({Key? key, required this.user}) : super(key: key);

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(widget.user.avatarUrl),
            ),
            const SizedBox(height: 16.0),
            Text(
              widget.user.firstName,
              style:
                  const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8.0),
            Text(
              widget.user.description,
              style: const TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'Habilidades:',
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            // Mapea las habilidades y muestra la información
            Column(
              children: widget.user.abilities.map((ability) {
                return ListTile(
                  title: Text(ability.displayName),
                  subtitle: Text(ability.description),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(ability.displayIcon),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}
