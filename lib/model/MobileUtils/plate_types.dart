class PlateType {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;

  PlateType({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
  });

  factory PlateType.fromJson(Map<String, dynamic> json) {
    return PlateType(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
    );
  }
}
