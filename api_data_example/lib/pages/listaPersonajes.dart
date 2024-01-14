import 'package:api_data_example/api.dart';
import 'package:api_data_example/models/user.dart';
import 'package:api_data_example/pages/personajes.dart';
import 'package:flutter/material.dart';

enum AgentRole {
  // ignore: constant_identifier_names
  Duelist,
  // ignore: constant_identifier_names
  Initiator,
  // ignore: constant_identifier_names
  Controller,
  // ignore: constant_identifier_names
  Sentinel,
  // ignore: constant_identifier_names
  Todos,
}

class ListaPersonajes extends StatefulWidget {
  const ListaPersonajes({Key? key});

  @override
  State<ListaPersonajes> createState() => _ListaPersonajesState();
}

class _ListaPersonajesState extends State<ListaPersonajes> {
  AgentRole _selectedRole = AgentRole.Duelist;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 41, 41, 41),
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: const Text('Menu Principal'),
        backgroundColor: const Color.fromARGB(255, 189, 70, 62),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedRole = AgentRole.Todos;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedRole == AgentRole.Todos ? 40.0 : 30.0,
                    height: _selectedRole == AgentRole.Todos ? 40.0 : 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedRole == AgentRole.Todos
                          ? Colors.red
                          : const Color.fromARGB(255, 189, 70, 62),
                    ),
                    child: const Center(
                      child: Text(
                        "1",
                        style: TextStyle(fontSize: 14.0, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedRole = AgentRole.Duelist;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedRole == AgentRole.Duelist ? 40.0 : 30.0,
                    height: _selectedRole == AgentRole.Duelist ? 40.0 : 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedRole == AgentRole.Duelist
                          ? Colors.red
                          : const Color.fromARGB(255, 189, 70, 62),
                    ),
                    child: Image.network(
                      "https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png",
                      width: 20.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedRole = AgentRole.Sentinel;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedRole == AgentRole.Sentinel ? 40.0 : 30.0,
                    height: _selectedRole == AgentRole.Sentinel ? 40.0 : 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedRole == AgentRole.Sentinel
                          ? Colors.red
                          : const Color.fromARGB(255, 189, 70, 62),
                    ),
                    child: Image.network(
                      "https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png",
                      width: 20.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedRole = AgentRole.Controller;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedRole == AgentRole.Controller ? 40.0 : 30.0,
                    height: _selectedRole == AgentRole.Controller ? 40.0 : 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedRole == AgentRole.Controller
                          ? Colors.red
                          : const Color.fromARGB(255, 189, 70, 62),
                    ),
                    child: Image.network(
                      "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png",
                      width: 20.0,
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _selectedRole = AgentRole.Initiator;
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: _selectedRole == AgentRole.Initiator ? 40.0 : 30.0,
                    height: _selectedRole == AgentRole.Initiator ? 40.0 : 30.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _selectedRole == AgentRole.Initiator
                          ? Colors.red
                          : const Color.fromARGB(255, 189, 70, 62),
                    ),
                    child: Image.network(
                      "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png",
                      width: 20.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: FutureBuilder(
              future: apiLoadUsers(
                role: _selectedRole == AgentRole.Todos
                    ? null
                    : _selectedRole.toString().split('.').last,
              ),
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
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DatosPersonajes(
                                user: userList[index],
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 189, 70, 62),
                          padding: const EdgeInsets.all(8.0),
                        ),
                        child: ListTile(
                          contentPadding: const EdgeInsets.all(8.0),
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userList[index].avatarUrl),
                          ),
                          title: Text(
                            userList[index].firstName,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 14.0),
                          ),
                          subtitle: Text(
                            userList[index].description,
                            style: const TextStyle(
                                color: Colors.white, fontSize: 12.0),
                          ),
                          trailing: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                userList[index].rol,
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 12.0),
                              ),
                              Image.network(
                                userList[index].iconoRol,
                                width: 16,
                                height: 16,
                              ),
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
}
