import 'package:api_data_example/models/user-map.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });

  final UserMap user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.displayName),
      subtitle: Text(user.narrativeDescription),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.displayIcon),
      ),
    );
  }
}
