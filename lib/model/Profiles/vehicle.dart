class Vehicle {
  String id;
  DateTime creationDate;
  bool deleted;
  String plateNumber;
  String? governorateId;
  String? governorateName;
  String plateCharacterId;
  String plateCharacterName;
  String plateTypeId;
  String plateTypeName;
  String pathId;
  String pathName;
  String chassisNumber;
  String vehicleTypeId;
  String vehicleTypeName;
  int manufacturingYear;
  String vehicleModelId;
  String vehicleModelName;
  String? note;
  String vehicleLicense;
  String color;
  String ownerId;
  String ownerName;
  String ownerImage;
  int status;
  int numberOfSeats;
  String? smartCardNumber;
  int? fare;
  bool isActive;
  List<String> vehicleLicenseImages;
  List<String> vehicleImages;
  bool? isOwner;
  int vehicleRegistrationState;
  int vehiclePathReceiptNumber;
  String? rejectReason;
  String? debtStatementNumber;
  DateTime? debtStatementExpiredDate;
  String? clearanceNumber;
  DateTime? clearanceExpiredDate;
  bool? isNew;
  DateTime? deportationDate;
  DateTime? sheddingDate;

  Vehicle({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.plateNumber,
    required this.governorateId,
    required this.governorateName,
    required this.plateCharacterId,
    required this.plateCharacterName,
    required this.plateTypeId,
    required this.plateTypeName,
    required this.pathId,
    required this.pathName,
    required this.chassisNumber,
    required this.vehicleTypeId,
    required this.vehicleTypeName,
    required this.manufacturingYear,
    required this.vehicleModelId,
    required this.vehicleModelName,
    required this.note,
    required this.vehicleLicense,
    required this.color,
    required this.ownerId,
    required this.ownerName,
    required this.ownerImage,
    required this.status,
    required this.numberOfSeats,
    required this.smartCardNumber,
    required this.fare,
    required this.isActive,
    required this.vehicleLicenseImages,
    required this.vehicleImages,
    required this.isOwner,
    required this.vehicleRegistrationState,
    required this.vehiclePathReceiptNumber,
    required this.rejectReason,
    required this.debtStatementNumber,
    required this.debtStatementExpiredDate,
    required this.clearanceNumber,
    required this.clearanceExpiredDate,
    required this.isNew,
    required this.deportationDate,
    required this.sheddingDate,
  });

  // Factory method to create a Vehicle from JSON
  factory Vehicle.fromJson(Map<String, dynamic> json) {
  return Vehicle(
    id: json['id'],
    creationDate: DateTime.parse(json['creationDate']),
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
    note: json['note'] ?? "",  // Example of handling nullable String
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
    vehicleLicenseImages: List<String>.from(json['vehicleLicenseImages'] ?? []),
    vehicleImages: List<String>.from(json['vehicleImages'] ?? []),
    isOwner: json['isOwner'],
    vehicleRegistrationState: json['vehicleRegistrationState'],
    vehiclePathReceiptNumber: json['vehiclePathReceiptNumber'],
    rejectReason: json['rejectReason'],
    debtStatementNumber: json['debtStatementNumber'],
    debtStatementExpiredDate: json['debtStatementExpiredDate'] != null ? DateTime.tryParse(json['debtStatementExpiredDate']) : null,
    clearanceNumber: json['clearanceNumber'],
    clearanceExpiredDate: json['clearanceExpiredDate'] != null ? DateTime.parse(json['clearanceExpiredDate']) : null,
    isNew: json['isNew'],
    deportationDate: json['deportationDate'] != null ? DateTime.parse(json['deportationDate']) : null,
    sheddingDate: json['sheddingDate'] != null ? DateTime.parse(json['sheddingDate']) : null,
  );
}
  // Method to convert a Vehicle instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
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