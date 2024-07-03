class Register {
  int driverType;
  String fullName;
  String motherName;
  String governorateId;
  String address;
  int identityNumber;
  String issuer;
  DateTime registrationDate;
  String driverLicense;
  List<String> driverLicenseImages;
  String image;
  PostVehicle vehicle;

  Register({
    required this.driverType,
    required this.fullName,
    required this.motherName,
    required this.governorateId,
    required this.address,
    required this.identityNumber,
    required this.issuer,
    required this.registrationDate,
    required this.driverLicense,
    required this.driverLicenseImages,
    required this.image,
    required this.vehicle,
  });

  factory Register.fromJson(Map<String, dynamic> json) {
    return Register(
      driverType: json['driverType'],
      fullName: json['fullName'],
      motherName: json['motherName'],
      governorateId: json['governorateId'],
      address: json['address'],
      identityNumber: json['identityNumber'],
      issuer: json['issuer'],
      registrationDate: DateTime.parse(json['registrationDate']),
      driverLicense: json['driverLicense'],
      driverLicenseImages: List<String>.from(json['driverLicenseImages']),
      image: json['image'],
      vehicle: PostVehicle.fromJson(json['vehicle']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'driverType': driverType,
      'fullName': fullName,
      'motherName': motherName,
      'governorateId': governorateId,
      'address': address,
      'identityNumber': identityNumber,
      'issuer': issuer,
      'registrationDate': registrationDate.toIso8601String(),
      'driverLicense': driverLicense,
      'driverLicenseImages': driverLicenseImages,
      'image': image,
      'vehicle': vehicle.toJson(),
    };
  }
}

class PostVehicle {
  String plateNumber;
  String plateCharacterId;
  String governorateId;
  String plateTypeId;
  String chassisNumber;
  String vehicleTypeId;
  String vehicleModelId;
  int manufacturingYear;
  String color;
  int numberOfSeats;
  String? vehicleLicense;
  List<String> vehicleLicenseImages;
  List<String> vehicleImages;
  String? note;

  PostVehicle({
    required this.plateNumber,
    required this.plateCharacterId,
    required this.governorateId,
    required this.plateTypeId,
    required this.chassisNumber,
    required this.vehicleTypeId,
    required this.vehicleModelId,
    required this.manufacturingYear,
    required this.color,
    required this.numberOfSeats,
    required this.vehicleLicense,
    required this.vehicleLicenseImages,
    required this.vehicleImages,
    required this.note,
  });

  factory PostVehicle.fromJson(Map<String, dynamic> json) {
    return PostVehicle(
      plateNumber: json['plateNumber'],
      plateCharacterId: json['plateCharacterId'],
      governorateId: json['governorateId'],
      plateTypeId: json['plateTypeId'],
      chassisNumber: json['chassisNumber'],
      vehicleTypeId: json['vehicleTypeId'],
      vehicleModelId: json['vehicleModelId'],
      manufacturingYear: json['manufacturingYear'],
      color: json['color'],
      numberOfSeats: json['numberOfSeats'],
      vehicleLicense: json['vehicleLicense'],
      vehicleLicenseImages: List<String>.from(json['vehicleLicenseImages']),
      vehicleImages: List<String>.from(json['vehicleImages']),
      note: json['note'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'plateNumber': plateNumber,
      'plateCharacterId': plateCharacterId,
      'governorateId': governorateId,
      'plateTypeId': plateTypeId,
      'chassisNumber': chassisNumber,
      'vehicleTypeId': vehicleTypeId,
      'vehicleModelId': vehicleModelId,
      'manufacturingYear': manufacturingYear,
      'color': color,
      'numberOfSeats': numberOfSeats,
      'vehicleLicense': vehicleLicense,
      'vehicleLicenseImages': vehicleLicenseImages,
      'vehicleImages': vehicleImages,
      'note': note,
    };
  }
}
