import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Map {
  final String displayName;
  final String narrativeDescription;
  final String displayIcon;

  Map({
    required this.displayName,
    required this.narrativeDescription,
    required this.displayIcon,
  });
}

class ListaMapas extends StatefulWidget {
  const ListaMapas({Key? key});

  @override
  State<ListaMapas> createState() => _ListaMapasState();
}

class _ListaMapasState extends State<ListaMapas> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: const Text('Lista de Mapas'),
        backgroundColor: const Color.fromARGB(255, 189, 70, 62),
      ),
      body: FutureBuilder(
        future: apiLoadMaps(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Map>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final mapList = snapshot.data!;
          return ListView.builder(
            itemCount: mapList.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Navegación a detalles del mapa
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 189, 70, 62),
                    padding: const EdgeInsets.all(8.0),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(8.0),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(mapList[index].displayIcon),
                    ),
                    title: Text(
                      mapList[index].displayName,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14.0,
                      ),
                    ),
                    subtitle: Text(
                      mapList[index].narrativeDescription,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Future<List<Map>> apiLoadMaps() async {
    try {
      final uri = Uri.parse("https://valorant-api.com/v1/maps"); // Reemplaza con la URL real de la API de mapas
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
            "Failed to load map data. Status code: ${response.statusCode}");
      }

      final json = jsonDecode(response.body);
      final jsonMapList = json["data"];
      final List<Map> mapList = [];

      for (final jsonMap in jsonMapList) {
        final map = Map(
          displayName: jsonMap['displayName'],
          narrativeDescription: jsonMap['narrativeDescription'],
          displayIcon: jsonMap['displayIcon'],
        );
        mapList.add(map);
      }

      return mapList;
    } catch (e) {
      rethrow;
    }
  }
}
