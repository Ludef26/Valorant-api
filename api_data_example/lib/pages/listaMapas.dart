import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:api_data_example/models/user-map.dart';
import 'package:api_data_example/api_map.dart';

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
        title: const Text('Lista Mapas'),  // Corrected the title
        backgroundColor: const Color.fromARGB(255, 189, 70, 62),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: loadData(),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<UserMap>> snapshot,
              ) {
                if (!snapshot.hasData) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                final userList = snapshot.data!;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {},  // Add the desired functionality
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 189, 70, 62),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].displayIcon),
                          ),
                          title: Text(
                            userList[index].displayName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                          subtitle: Text(
                            userList[index].narrativeDescription,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12.0),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              // Add any additional widgets or functionality here
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Future<List<UserMap>> loadData() async {
    try {
      final uri = Uri.parse("https://valorant-api.com/v1/maps");
      final response = await http.get(uri);

      if (response.statusCode != 200) {
        throw Exception(
            "Failed to load data from the API. Status code: ${response.statusCode}");
      }

      final json = jsonDecode(response.body);
      final jsonUserList = json["data"];
      final List<UserMap> userList = []; // Assuming you parse the data appropriately

      // Parse the JSON data and populate the userList
      for (var userData in jsonUserList) {
        userList.add(UserMap.fromJson(userData));
      }

      return userList;
    } catch (e) {
      rethrow;
    }
  }
}
