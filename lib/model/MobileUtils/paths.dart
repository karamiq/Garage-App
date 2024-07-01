import 'garages.dart';
import 'path_type.dart';

class Path {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  PathType pathType;
  Garage fromGarage;
  Garage toGarage;
  double distance;
  double fare;
  bool isActive;
  List<CarSeatPrice> carSeatPrices;

  Path({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
    required this.pathType,
    required this.fromGarage,
    required this.toGarage,
    required this.distance,
    required this.fare,
    required this.isActive,
    required this.carSeatPrices,
  });

  factory Path.fromJson(Map<String, dynamic> json) {
    return Path(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
      pathType: PathType.fromJson(json['pathType']),
      fromGarage: Garage.fromJson(json['fromGarage']),
      toGarage: Garage.fromJson(json['toGarage']),
      distance: json['distance'],
      fare: json['fare'],
      isActive: json['isActive'],
      carSeatPrices: (json['carSeatPrices'] as List<dynamic>)
          .map((e) => CarSeatPrice.fromJson(e))
          .toList(),
    );
  }
}

class CarSeatPrice {
  String id;
  DateTime creationDate;
  bool deleted;
  double price;
  String vehicleTypeId;
  String vehicleTypeName;

  CarSeatPrice({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.price,
    required this.vehicleTypeId,
    required this.vehicleTypeName,
  });

  factory CarSeatPrice.fromJson(Map<String, dynamic> json) {
    return CarSeatPrice(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      price: json['price'],
      vehicleTypeId: json['vehicleTypeId'],
      vehicleTypeName: json['vehicleTypeName'],
    );
  }
}
