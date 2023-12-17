class User {
  String firstName, description;
  String avatarUrl;

  User.fromJson(Map<String, dynamic> json)
      : firstName = json["displayName"],
        description = json["description"],
        avatarUrl = json["displayIcon"];
}
