import 'package:api_data_example/api.dart';
import 'package:api_data_example/models/user.dart';
import 'package:api_data_example/widgets/user_list_item.dart';
import 'package:flutter/material.dart';

class ListaPersonajes extends StatefulWidget {
  const ListaPersonajes({super.key});

  @override
  State<ListaPersonajes> createState() => _ListaPersonajesState();
}

class _ListaPersonajesState extends State<ListaPersonajes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pantalla de Lista Personajes2'),
      ),
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<User>> snapshot,
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
              return UserListItem(user: userList[index]);
            },
          );
        },
      ),
    );
  }
}
