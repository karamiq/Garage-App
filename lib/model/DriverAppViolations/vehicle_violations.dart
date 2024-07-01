class VehicleViolation {
  String id;
  DateTime creationDate;
  bool deleted;
  int number;
  String userId;
  String userFullName;
  String userGarageId;
  String userGarageName;
  String garageGovernorateName;
  String vehicleId;
  String vehicleChassisNumber;
  String vehiclePlateCharacterName;
  String vehiclePlateType;
  String vehicleGovernorateName;
  String plateNumber;
  FeeFines feeFines;
  bool isPaid;
  List<String> images;
  int duplicateCount;
  double amount;
  double totalAmount;
  String lat;
  String lng;
  int invoiceNumber;
  String violationPayReceiptId;
  int violationPayReceiptNumber;

  VehicleViolation({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.number,
    required this.userId,
    required this.userFullName,
    required this.userGarageId,
    required this.userGarageName,
    required this.garageGovernorateName,
    required this.vehicleId,
    required this.vehicleChassisNumber,
    required this.vehiclePlateCharacterName,
    required this.vehiclePlateType,
    required this.vehicleGovernorateName,
    required this.plateNumber,
    required this.feeFines,
    required this.isPaid,
    required this.images,
    required this.duplicateCount,
    required this.amount,
    required this.totalAmount,
    required this.lat,
    required this.lng,
    required this.invoiceNumber,
    required this.violationPayReceiptId,
    required this.violationPayReceiptNumber,
  });

  factory VehicleViolation.fromJson(Map<String, dynamic> json) {
    return VehicleViolation(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      number: json['number'],
      userId: json['userId'],
      userFullName: json['userFullName'],
      userGarageId: json['userGarageId'],
      userGarageName: json['userGarageName'],
      garageGovernorateName: json['garageGovernorateName'],
      vehicleId: json['vehicleId'],
      vehicleChassisNumber: json['vehicleChassisNumber'],
      vehiclePlateCharacterName: json['vehiclePlateCharacterName'],
      vehiclePlateType: json['vehiclePlateType'],
      vehicleGovernorateName: json['vehicleGovernorateName'],
      plateNumber: json['plateNumber'],
      feeFines: FeeFines.fromJson(json['feeFines']),
      isPaid: json['isPaid'],
      images: (json['images'] as List<dynamic>).cast<String>(),
      duplicateCount: json['duplicateCount'],
      amount: json['amount'],
      totalAmount: json['totalAmount'],
      lat: json['lat'],
      lng: json['lng'],
      invoiceNumber: json['invoiceNumber'],
      violationPayReceiptId: json['violationPayReceiptId'],
      violationPayReceiptNumber: json['violationPayReceiptNumber'],
    );
  }
}

class FeeFines {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  double amount;
  int type;

  FeeFines({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
    required this.amount,
    required this.type,
  });

  factory FeeFines.fromJson(Map<String, dynamic> json) {
    return FeeFines(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
      amount: json['amount'],
      type: json['type'],
    );
  }
}
