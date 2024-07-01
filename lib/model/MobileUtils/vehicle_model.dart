class VehicleModel {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;

  VehicleModel({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
    );
  }
}
