import 'package:api_data_example/api.dart';
import 'package:api_data_example/models/user.dart';
//import 'package:api_data_example/widgets/user_list_item.dart';
import 'package:flutter/material.dart';

// ignore: constant_identifier_names
enum AgentRole { Duelist, Initiator, Controller, Sentinel, Todos }

class ListaPersonajes extends StatefulWidget {
  const ListaPersonajes({super.key});

  @override
  State<ListaPersonajes> createState() => _ListaPersonajesState();
}

class _ListaPersonajesState extends State<ListaPersonajes> {
  AgentRole _selectedRole = AgentRole.Duelist; // Rol predeterminado
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41), // Fondo negro
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: const Text('Pantalla de Lista Personajes2'),
        backgroundColor: const Color.fromARGB(255, 189, 70, 62), // Fondo negro
      ),
      body: Column(
        children: [
          // Fila de botones arriba
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment
                .center, // Alinea los elementos verticalmente al centro
            children: [
              Flexible(
                flex: 1,
                child: SizedBox(
                  width: double.infinity,
                  height: 60.0, // Altura del contenedor
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _selectedRole =
                            AgentRole.Todos; // Cambia según el botón presionado
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors
                            .blue, // Puedes cambiar el color de fondo según tus preferencias
                      ),
                      child: const Center(
                        child: Text("1",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Image.network(
                      "https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png"),
                  onPressed: () {
                    setState(() {
                      _selectedRole =
                          AgentRole.Duelist; // Cambia según el botón presionado
                    });
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Image.network(
                      "https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png"),
                  onPressed: () {
                    setState(() {
                      _selectedRole = AgentRole
                          .Sentinel; // Cambia según el botón presionado
                    });
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Image.network(
                      "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png"),
                  onPressed: () {
                    setState(() {
                      _selectedRole = AgentRole
                          .Controller; // Cambia según el botón presionado
                    });
                  },
                ),
              ),
              Flexible(
                flex: 1,
                child: IconButton(
                  icon: Image.network(
                      "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png"),
                  onPressed: () {
                    setState(() {
                      _selectedRole = AgentRole
                          .Initiator; // Cambia según el botón presionado
                    });
                  },
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: apiLoadUsers(
                  role: _selectedRole == AgentRole.Todos
                      ? null
                      : _selectedRole.toString().split('.').last),
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
                //Imprime por pantalla una lista de botones con datos sobre los personajes
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context,
                            "Datos Personajes"); //Ruta para Datos Personajes
                      },
                      child: ListTile(
                        leading: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userList[index].avatarUrl),
                        ),
                        title: Text(userList[index].firstName),
                        subtitle: Text(userList[index].description),
                        trailing: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(userList[index].rol),
                            Image.network(
                              userList[index].iconoRol,
                              width: 24,
                              height: 24,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
