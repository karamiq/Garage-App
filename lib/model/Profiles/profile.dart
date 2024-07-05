import 'package:Trip/model/Profiles/driver_card.dart';
import 'package:Trip/model/Profiles/vehicle.dart';

class Profile {
  final String? id;
  final DateTime? creationDate;
  final bool? deleted;
  final String? fullName;
  final String? governorateId;
  final String? governorateName;
  final String? address;
  final String? identityNumber;
  final String? issuer;
  final int? registrationNumber;
  final int? newspaperNumber;
  final String? motherName;
  final String? phoneNumber;
  final DateTime? registrationDate;
  final List<Vehicle>? vehicle;
  final String? image;
  final List<String>? driverLicenseImages;
  final bool? isActive;
  final int? registerState;
  final int? driverType;
  final DriverCard? driverCard;
  final String? driverLicense;

  Profile({
    this.id,
    this.creationDate,
    this.deleted,
    this.fullName,
    this.governorateId,
    this.governorateName,
    this.address,
    this.identityNumber,
    this.issuer,
    this.registrationNumber,
    this.newspaperNumber,
    this.motherName,
    this.phoneNumber,
    this.registrationDate,
    this.vehicle,
    this.image,
    this.driverLicenseImages,
    this.isActive,
    this.registerState,
    this.driverType,
    this.driverCard,
    this.driverLicense,
  });
  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      id: json['id'],
      creationDate: json['creationDate'] != null
          ? DateTime.parse(json['creationDate'])
          : null,
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
      registrationDate: json['registrationDate'] != null
          ? DateTime.parse(json['registrationDate'])
          : null,
      vehicle: json['vehicle'] != null
          ? (json['vehicle'] as List).map((i) => Vehicle.fromJson(i)).toList()
          : null,
      image: json['image'],
      driverLicenseImages: json['driverLicenseImages'] != null
          ? List<String>.from(json['driverLicenseImages'])
          : null,
      isActive: json['isActive'],
      registerState: json['registerState'],
      driverType: json['driverType'],
      driverCard: json['driverCard'] != null
          ? DriverCard.fromJson(json['driverCard'])
          : null,
      driverLicense: json['driverLicense'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate?.toIso8601String(),
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
      'registrationDate': registrationDate?.toIso8601String(),
      'vehicle': vehicle?.map((i) => i.toJson()).toList(),
      'image': image,
      'driverLicenseImages': driverLicenseImages,
      'isActive': isActive,
      'registerState': registerState,
      'driverType': driverType,
      'driverCard': driverCard?.toJson(),
      'driverLicense': driverLicense,
    };
  }
}