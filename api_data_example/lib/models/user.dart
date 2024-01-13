class User {
  String uuid, firstName, description;
  String avatarUrl;
  String rol, iconoRol;
  List<Ability> abilities;

  User.fromJson(Map<String, dynamic> json)
      : uuid = json["uuid"] ?? "",
        firstName = json["displayName"] ?? "",
        description = json["description"] ?? "",
        avatarUrl = json["displayIcon"] ?? "",
        rol = json["role"]?["displayName"] ?? "",
        iconoRol = json["role"]?["displayIcon"] ?? "",
        abilities = (json["abilities"] as List<dynamic>?)
                ?.map((ability) => Ability.fromJson(ability))
                .toList() ??
            [];
}

class Ability {
  String slot, displayName, description, displayIcon;

  Ability.fromJson(Map<String, dynamic> json)
      : slot = json["slot"] ?? "",
        displayName = json["displayName"] ?? "",
        description = json["description"] ?? "",
        displayIcon = json["displayIcon"] ?? "";
}
