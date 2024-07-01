class PlateCharacter {
  String name;
  String governorateId;
  String governorateName;
  String id;
  DateTime creationDate;
  bool deleted;

  PlateCharacter({
    required this.name,
    required this.governorateId,
    required this.governorateName,
    required this.id,
    required this.creationDate,
    required this.deleted,
  });

  factory PlateCharacter.fromJson(Map<String, dynamic> json) {
    return PlateCharacter(
      name: json['name'],
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
    );
  }
}
