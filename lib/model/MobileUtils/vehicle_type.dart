class VehicleType {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  int numberOfSeat;

  VehicleType({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
    required this.numberOfSeat,
  });

  factory VehicleType.fromJson(Map<String, dynamic> json) {
    return VehicleType(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
      numberOfSeat: json['numberOfSeat'],
    );
  }
}
