import 'package:api_data_example/api.dart';
import 'package:api_data_example/models/user.dart';
import 'package:api_data_example/pages/personajes.dart';
import 'package:flutter/material.dart';

enum AgentRole {
  Duelist,
  Initiator,
  Controller,
  Sentinel,
  Todos,
}

extension AgentRoleExtension on AgentRole {
  dynamic get icon {
    switch (this) {
      case AgentRole.Duelist:
        return "https://media.valorant-api.com/agents/roles/dbe8757e-9e92-4ed4-b39f-9dfc589691d4/displayicon.png";
      case AgentRole.Initiator:
        return "https://media.valorant-api.com/agents/roles/1b47567f-8f7b-444b-aae3-b0c634622d10/displayicon.png";
      case AgentRole.Controller:
        return "https://media.valorant-api.com/agents/roles/4ee40330-ecdd-4f2f-98a8-eb1243428373/displayicon.png";
      case AgentRole.Sentinel:
        return "https://media.valorant-api.com/agents/roles/5fc02f99-4091-4486-a531-98459a3e95e9/displayicon.png";
      case AgentRole.Todos:
        return 1;
    }
  }
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
              buildRoleButton(AgentRole.Todos, 30.0),
              buildRoleButton(AgentRole.Duelist, 30.0),
              buildRoleButton(AgentRole.Sentinel, 30.0),
              buildRoleButton(AgentRole.Controller, 30.0),
              buildRoleButton(AgentRole.Initiator, 24.0),
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

  Widget buildRoleButton(AgentRole role, double size) {
    return Flexible(
      flex: 1,
      child: InkWell(
        onTap: () {
          setState(() {
            _selectedRole = role;
          });
        },
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: _selectedRole == role ? size + 10.0 : size,
              height: _selectedRole == role ? size + 10.0 : size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _selectedRole == role
                    ? const Color.fromARGB(255, 189, 70, 62)
                    : Color.fromARGB(255, 48, 48, 48),
              ),
            ),
            if (role != AgentRole.Todos)
              Image.network(
                role.icon,
                width: size,
                color: Colors.white,
              ),
            if (role == AgentRole.Todos)
              const Center(
                child: Text(
                  "1",
                  style: TextStyle(fontSize: 14.0, color: Colors.white),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
