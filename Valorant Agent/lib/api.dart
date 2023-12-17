import 'dart:convert';

import 'package:api_data_example/models/user.dart';
import 'package:http/http.dart' as http;

Future<List<User>> apiLoadUsers() async {
  final uri = Uri.parse("https://valorant-api.com/v1/agents");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonUserList = json["data"];
  final List<User> userList = [];
  for (final jsonUser in jsonUserList) {
    final user = User.fromJson(jsonUser);
    userList.add(user);
  }
  return userList;
}
