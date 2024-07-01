import 'cities_and_governorate.dart';

class Garage {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  City city;
  String lat;
  String lng;
  bool isActive;

  Garage({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
    required this.city,
    required this.lat,
    required this.lng,
    required this.isActive,
  });

  factory Garage.fromJson(Map<String, dynamic> json) {
    return Garage(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
      city: City.fromJson(json['city']),
      lat: json['lat'],
      lng: json['lng'],
      isActive: json['isActive'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deleted': deleted,
      'name': name,
      'city': city.toJson(),
      'lat': lat,
      'lng': lng,
      'isActive': isActive,
    };
  }
}
