class VehiclePathLocation {
  String fromGarageLat;
  String fromGarageLng;
  String fromGarageName;
  String toGarageLat;
  String toGarageLng;
  String toGarageName;

  VehiclePathLocation({
    required this.fromGarageLat,
    required this.fromGarageLng,
    required this.fromGarageName,
    required this.toGarageLat,
    required this.toGarageLng,
    required this.toGarageName,
  });

  factory VehiclePathLocation.fromJson(Map<String, dynamic> json) {
    return VehiclePathLocation(
      fromGarageLat: json['fromGarageLat'],
      fromGarageLng: json['fromGarageLng'],
      fromGarageName: json['fromGarageName'],
      toGarageLat: json['toGarageLat'],
      toGarageLng: json['toGarageLng'],
      toGarageName: json['toGarageName'],
    );
  }
}
