class VehicleViolations {
  int accumulatedPrice;
  int numberOfViolation;
  List<Violation> vehicleViolations;

  VehicleViolations({
    required this.accumulatedPrice,
    required this.numberOfViolation,
    required this.vehicleViolations,
  });

  factory VehicleViolations.fromJson(Map<String, dynamic> json) {
    List<Violation> violationsList = [];
    if (json['vehicleViolations'] != null) {
      var violationsJson = json['vehicleViolations'] as List;
      violationsList =
          violationsJson.map((v) => Violation.fromJson(v)).toList();
    }
    return VehicleViolations(
      accumulatedPrice: json['accumulatedPrice'] ?? 0,
      numberOfViolation: json['numberOfViolation'] ?? 0,
      vehicleViolations: violationsList,
    );
  }
}

class Violation {
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
  int amount;
  int totalAmount;
  String lat;
  String lng;
  int invoiceNumber;
  String violationPayReceiptId;
  int violationPayReceiptNumber;

  Violation({
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

  factory Violation.fromJson(Map<String, dynamic> json) {
    return Violation(
      id: json['id'] ?? '',
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'] ?? false,
      number: json['number'] ?? 0,
      userId: json['userId'] ?? '',
      userFullName: json['userFullName'] ?? '',
      userGarageId: json['userGarageId'] ?? '',
      userGarageName: json['userGarageName'] ?? '',
      garageGovernorateName: json['garageGovernorateName'] ?? '',
      vehicleId: json['vehicleId'] ?? '',
      vehicleChassisNumber: json['vehicleChassisNumber'] ?? '',
      vehiclePlateCharacterName: json['vehiclePlateCharacterName'] ?? '',
      vehiclePlateType: json['vehiclePlateType'] ?? '',
      vehicleGovernorateName: json['vehicleGovernorateName'] ?? '',
      plateNumber: json['plateNumber'] ?? '',
      feeFines: FeeFines.fromJson(json['feeFines']),
      isPaid: json['isPaid'] ?? false,
      images: List<String>.from(json['images'] ?? []),
      duplicateCount: json['duplicateCount'] ?? 0,
      amount: json['amount'] ?? 0,
      totalAmount: json['totalAmount'] ?? 0,
      lat: json['lat'] ?? '',
      lng: json['lng'] ?? '',
      invoiceNumber: json['invoiceNumber'] ?? 0,
      violationPayReceiptId: json['violationPayReceiptId'] ?? '',
      violationPayReceiptNumber: json['violationPayReceiptNumber'] ?? 0,
    );
  }
}

class FeeFines {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  int amount;
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
      id: json['id'] ?? '',
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'] ?? false,
      name: json['name'] ?? '',
      amount: json['amount'] ?? 0,
      type: json['type'] ?? 0,
    );
  }
}
