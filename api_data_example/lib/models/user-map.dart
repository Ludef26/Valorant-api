class UserMap {
  String displayName, narrativeDescription, displayIcon;

  UserMap.fromJson(Map<String, dynamic> json)
      : displayName = json["displayName"] ?? "",
        narrativeDescription = json["narrativeDescription"] ?? "",
        displayIcon = json["displayIcon"] ?? "";
}
