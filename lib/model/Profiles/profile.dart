import 'driver_card.dart';

class Profile {
  String id;
  DateTime creationDate;
  bool deleted;
  String fullName;
  String governorateId;
  String governorateName;
  String address;
  String identityNumber;
  String issuer;
  int registrationNumber;
  int newspaperNumber;
  String motherName;
  String phoneNumber;
  DateTime registrationDate;
  String image;
  List<String> driverLicenseImages;
  bool isActive;
  int registerState;
  int driverType;
  DriverCard driverCard;
  String driverLicense;

  Profile({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.fullName,
    required this.governorateId,
    required this.governorateName,
    required this.address,
    required this.identityNumber,
    required this.issuer,
    required this.registrationNumber,
    required this.newspaperNumber,
    required this.motherName,
    required this.phoneNumber,
    required this.registrationDate,
    required this.image,
    required this.driverLicenseImages,
    required this.isActive,
    required this.registerState,
    required this.driverType,
    required this.driverCard,
    required this.driverLicense,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      fullName: json['fullName'],
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
      address: json['address'],
      identityNumber: json['identityNumber'],
      issuer: json['issuer'],
      registrationNumber: json['registrationNumber'],
      newspaperNumber: json['newspaperNumber'],
      motherName: json['motherName'],
      phoneNumber: json['phoneNumber'],
      registrationDate: DateTime.parse(json['registrationDate']),
      image: json['image'],
      driverLicenseImages: List<String>.from(json['driverLicenseImages']),
      isActive: json['isActive'],
      registerState: json['registerState'],
      driverType: json['driverType'],
      driverCard: DriverCard.fromJson(json['driverCard']),
      driverLicense: json['driverLicense'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deleted': deleted,
      'fullName': fullName,
      'governorateId': governorateId,
      'governorateName': governorateName,
      'address': address,
      'identityNumber': identityNumber,
      'issuer': issuer,
      'registrationNumber': registrationNumber,
      'newspaperNumber': newspaperNumber,
      'motherName': motherName,
      'phoneNumber': phoneNumber,
      'registrationDate': registrationDate.toIso8601String(),
      'image': image,
      'driverLicenseImages': driverLicenseImages,
      'isActive': isActive,
      'registerState': registerState,
      'driverType': driverType,
      'driverCard': driverCard.toJson(),
      'driverLicense': driverLicense,
    };
  }
}
