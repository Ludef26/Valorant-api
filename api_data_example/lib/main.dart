import 'package:api_data_example/api.dart';
import 'package:api_data_example/models/user.dart';
import 'package:api_data_example/widgets/user_list_item.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const ApiDataLoadApp());
}

class ApiDataLoadApp extends StatelessWidget {
  const ApiDataLoadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
      ),
    );
  }
}
