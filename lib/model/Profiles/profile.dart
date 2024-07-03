import 'package:flutter/foundation.dart';

class Driver {
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

  Driver({
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

  factory Driver.fromJson(Map<String, dynamic> json) {
    return Driver(
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

class Vehicle {
  final String? id;
  final DateTime? creationDate;
  final bool? deleted;
  final String? plateNumber;
  final String? governorateId;
  final String? governorateName;
  final String? plateCharacterId;
  final String? plateCharacterName;
  final String? plateTypeId;
  final String? plateTypeName;
  final String? pathId;
  final String? pathName;
  final String? chassisNumber;
  final String? vehicleTypeId;
  final String? vehicleTypeName;
  final int? manufacturingYear;
  final String? vehicleModelId;
  final String? vehicleModelName;
  final String? note;
  final String? vehicleLicense;
  final String? color;
  final String? ownerId;
  final String? ownerName;
  final String? ownerImage;
  final int? status;
  final int? numberOfSeats;
  final String? smartCardNumber;
  final int? fare;
  final bool? isActive;
  final List<String>? vehicleLicenseImages;
  final List<String>? vehicleImages;
  final bool? isOwner;
  final int? vehicleRegistrationState;
  final int? vehiclePathReceiptNumber;
  final String? rejectReason;
  final String? debtStatementNumber;
  final DateTime? debtStatementExpiredDate;
  final String? clearanceNumber;
  final DateTime? clearanceExpiredDate;
  final bool? isNew;
  final DateTime? deportationDate;
  final DateTime? sheddingDate;

  Vehicle({
    this.id,
    this.creationDate,
    this.deleted,
    this.plateNumber,
    this.governorateId,
    this.governorateName,
    this.plateCharacterId,
    this.plateCharacterName,
    this.plateTypeId,
    this.plateTypeName,
    this.pathId,
    this.pathName,
    this.chassisNumber,
    this.vehicleTypeId,
    this.vehicleTypeName,
    this.manufacturingYear,
    this.vehicleModelId,
    this.vehicleModelName,
    this.note,
    this.vehicleLicense,
    this.color,
    this.ownerId,
    this.ownerName,
    this.ownerImage,
    this.status,
    this.numberOfSeats,
    this.smartCardNumber,
    this.fare,
    this.isActive,
    this.vehicleLicenseImages,
    this.vehicleImages,
    this.isOwner,
    this.vehicleRegistrationState,
    this.vehiclePathReceiptNumber,
    this.rejectReason,
    this.debtStatementNumber,
    this.debtStatementExpiredDate,
    this.clearanceNumber,
    this.clearanceExpiredDate,
    this.isNew,
    this.deportationDate,
    this.sheddingDate,
  });

  factory Vehicle.fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json['id'],
      creationDate: json['creationDate'] != null
          ? DateTime.parse(json['creationDate'])
          : null,
      deleted: json['deleted'],
      plateNumber: json['plateNumber'],
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
      plateCharacterId: json['plateCharacterId'],
      plateCharacterName: json['plateCharacterName'],
      plateTypeId: json['plateTypeId'],
      plateTypeName: json['plateTypeName'],
      pathId: json['pathId'],
      pathName: json['pathName'],
      chassisNumber: json['chassisNumber'],
      vehicleTypeId: json['vehicleTypeId'],
      vehicleTypeName: json['vehicleTypeName'],
      manufacturingYear: json['manufacturingYear'],
      vehicleModelId: json['vehicleModelId'],
      vehicleModelName: json['vehicleModelName'],
      note: json['note'],
      vehicleLicense: json['vehicleLicense'],
      color: json['color'],
      ownerId: json['ownerId'],
      ownerName: json['ownerName'],
      ownerImage: json['ownerImage'],
      status: json['status'],
      numberOfSeats: json['numberOfSeats'],
      smartCardNumber: json['smartCardNumber'],
      fare: json['fare'],
      isActive: json['isActive'],
      vehicleLicenseImages: json['vehicleLicenseImages'] != null
          ? List<String>.from(json['vehicleLicenseImages'])
          : null,
      vehicleImages: json['vehicleImages'] != null
          ? List<String>.from(json['vehicleImages'])
          : null,
      isOwner: json['isOwner'],
      vehicleRegistrationState: json['vehicleRegistrationState'],
      vehiclePathReceiptNumber: json['vehiclePathReceiptNumber'],
      rejectReason: json['rejectReason'],
      debtStatementNumber: json['debtStatementNumber'],
      debtStatementExpiredDate: json['debtStatementExpiredDate'] != null
          ? DateTime.parse(json['debtStatementExpiredDate'])
          : null,
      clearanceNumber: json['clearanceNumber'],
      clearanceExpiredDate: json['clearanceExpiredDate'] != null
          ? DateTime.parse(json['clearanceExpiredDate'])
          : null,
      isNew: json['isNew'],
      deportationDate: json['deportationDate'] != null
          ? DateTime.parse(json['deportationDate'])
          : null,
      sheddingDate: json['sheddingDate'] != null
          ? DateTime.parse(json['sheddingDate'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate?.toIso8601String(),
      'deleted': deleted,
      'plateNumber': plateNumber,
      'governorateId': governorateId,
      'governorateName': governorateName,
      'plateCharacterId': plateCharacterId,
      'plateCharacterName': plateCharacterName,
      'plateTypeId': plateTypeId,
      'plateTypeName': plateTypeName,
      'pathId': pathId,
      'pathName': pathName,
      'chassisNumber': chassisNumber,
      'vehicleTypeId': vehicleTypeId,
      'vehicleTypeName': vehicleTypeName,
      'manufacturingYear': manufacturingYear,
      'vehicleModelId': vehicleModelId,
      'vehicleModelName': vehicleModelName,
      'note': note,
      'vehicleLicense': vehicleLicense,
      'color': color,
      'ownerId': ownerId,
      'ownerName': ownerName,
      'ownerImage': ownerImage,
      'status': status,
      'numberOfSeats': numberOfSeats,
      'smartCardNumber': smartCardNumber,
      'fare': fare,
      'isActive': isActive,
      'vehicleLicenseImages': vehicleLicenseImages,
      'vehicleImages': vehicleImages,
      'isOwner': isOwner,
      'vehicleRegistrationState': vehicleRegistrationState,
      'vehiclePathReceiptNumber': vehiclePathReceiptNumber,
      'rejectReason': rejectReason,
      'debtStatementNumber': debtStatementNumber,
      'debtStatementExpiredDate': debtStatementExpiredDate?.toIso8601String(),
      'clearanceNumber': clearanceNumber,
      'clearanceExpiredDate': clearanceExpiredDate?.toIso8601String(),
      'isNew': isNew,
      'deportationDate': deportationDate?.toIso8601String(),
      'sheddingDate': sheddingDate?.toIso8601String(),
    };
  }
}

class DriverCard {
  final String? id;
  final DateTime? creationDate;
  final bool? deleted;
  final int? number;
  final int? balance;
  final String? driverId;
  final String? driverFullName;
  final DateTime? expiredDate;
  final int? cardStatus;

  DriverCard({
    this.id,
    this.creationDate,
    this.deleted,
    this.number,
    this.balance,
    this.driverId,
    this.driverFullName,
    this.expiredDate,
    this.cardStatus,
  });

  factory DriverCard.fromJson(Map<String, dynamic> json) {
    return DriverCard(
      id: json['id'],
      creationDate: json['creationDate'] != null
          ? DateTime.parse(json['creationDate'])
          : null,
      deleted: json['deleted'],
      number: json['number'],
      balance: json['balance'],
      driverId: json['driverId'],
      driverFullName: json['driverFullName'],
      expiredDate: json['expiredDate'] != null
          ? DateTime.parse(json['expiredDate'])
          : null,
      cardStatus: json['cardStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate?.toIso8601String(),
      'deleted': deleted,
      'number': number,
      'balance': balance,
      'driverId': driverId,
      'driverFullName': driverFullName,
      'expiredDate': expiredDate?.toIso8601String(),
      'cardStatus': cardStatus,
    };
  }
}
