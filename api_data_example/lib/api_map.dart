import 'dart:convert';

import 'package:api_data_example/models/user-map.dart';
import 'package:http/http.dart' as http;

Future<List<UserMap>> apiLoadUsers({String? role}) async {
  try {
    final uri = Uri.parse("https://valorant-api.com/v1/maps");
    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception(
          "Failed to load data. Status code: ${response.statusCode}");
    }

    final json = jsonDecode(response.body);
    final jsonUserList = json["data"];
    final List<UserMap> userList = [];

    for (final jsonUser in jsonUserList) {
      final user = UserMap.fromJson(jsonUser);
    }

    //print("User List: $userList");

    return userList;
  } catch (e) {
    //print("Error loading data: $e");
    rethrow; // Reenvía la excepción después de imprimir el mensaje
  }
}
