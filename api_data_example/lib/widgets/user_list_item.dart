import 'package:api_data_example/models/user.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(user.firstName),
      subtitle: Text(user.description),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatarUrl),
      ),
    );
  }
}
