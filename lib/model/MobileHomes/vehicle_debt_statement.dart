class VehicleDebtStatement {
  double accumulatedPrice;
  int numberOfReceipt;
  List<DebtStatementReceipt> debtStatementReceipts;

  VehicleDebtStatement({
    required this.accumulatedPrice,
    required this.numberOfReceipt,
    required this.debtStatementReceipts,
  });

  factory VehicleDebtStatement.fromJson(Map<String, dynamic> json) {
    return VehicleDebtStatement(
      accumulatedPrice: json['accumulatedPrice'],
      numberOfReceipt: json['numberOfReceipt'],
      debtStatementReceipts: (json['debtStatementReceipts'] as List<dynamic>)
          .map((e) => DebtStatementReceipt.fromJson(e))
          .toList(),
    );
  }
}

class DebtStatementReceipt {
  String id;
  DateTime creationDate;
  bool deleted;
  int number;
  double amount;
  String vehicleId;
  String vehiclePlateNumber;
  String vehicleChassisNumber;
  String vehiclePlateCharacterId;
  String vehiclePlateCharacterName;
  String vehiclePlateTypeId;
  String vehiclePlateType;
  String vehicleGovernorateId;
  String vehicleGovernorateName;
  String garageId;
  String garageName;
  double totalTaxes;
  double taxes;
  double totalAmount;
  bool isPaid;
  DateTime expiredDate;

  DebtStatementReceipt({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.number,
    required this.amount,
    required this.vehicleId,
    required this.vehiclePlateNumber,
    required this.vehicleChassisNumber,
    required this.vehiclePlateCharacterId,
    required this.vehiclePlateCharacterName,
    required this.vehiclePlateTypeId,
    required this.vehiclePlateType,
    required this.vehicleGovernorateId,
    required this.vehicleGovernorateName,
    required this.garageId,
    required this.garageName,
    required this.totalTaxes,
    required this.taxes,
    required this.totalAmount,
    required this.isPaid,
    required this.expiredDate,
  });

  factory DebtStatementReceipt.fromJson(Map<String, dynamic> json) {
    return DebtStatementReceipt(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      number: json['number'],
      amount: json['amount'],
      vehicleId: json['vehicleId'],
      vehiclePlateNumber: json['vehiclePlateNumber'],
      vehicleChassisNumber: json['vehicleChassisNumber'],
      vehiclePlateCharacterId: json['vehiclePlateCharacterId'],
      vehiclePlateCharacterName: json['vehiclePlateCharacterName'],
      vehiclePlateTypeId: json['vehiclePlateTypeId'],
      vehiclePlateType: json['vehiclePlateType'],
      vehicleGovernorateId: json['vehicleGovernorateId'],
      vehicleGovernorateName: json['vehicleGovernorateName'],
      garageId: json['garageId'],
      garageName: json['garageName'],
      totalTaxes: json['totalTaxes'],
      taxes: json['taxes'],
      totalAmount: json['totalAmount'],
      isPaid: json['isPaid'],
      expiredDate: DateTime.parse(json['expiredDate']),
    );
  }
}
