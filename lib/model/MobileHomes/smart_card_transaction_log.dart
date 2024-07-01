class SmartCardTransactionLog {
  double balance;
  List<SmartCardTransactionHistory> history;

  SmartCardTransactionLog({
    required this.balance,
    required this.history,
  });

  factory SmartCardTransactionLog.fromJson(Map<String, dynamic> json) {
    return SmartCardTransactionLog(
      balance: json['balance'],
      history: (json['history'] as List<dynamic>)
          .map((e) => SmartCardTransactionHistory.fromJson(e))
          .toList(),
    );
  }
}

class SmartCardTransactionHistory {
  String id;
  DateTime creationDate;
  bool deleted;
  String smartCardId;
  String smartCardNumber;
  String vehicleId;
  String plateNumber;
  String governorateId;
  String governorateName;
  String plateCharacterId;
  String plateCharacterName;
  int action;
  double amount;
  String userId;
  String userFullName;
  String garageId;
  String garageName;
  String driverCardId;
  int driverCardNumber;
  FinancialLog financialLog;

  SmartCardTransactionHistory({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.smartCardId,
    required this.smartCardNumber,
    required this.vehicleId,
    required this.plateNumber,
    required this.governorateId,
    required this.governorateName,
    required this.plateCharacterId,
    required this.plateCharacterName,
    required this.action,
    required this.amount,
    required this.userId,
    required this.userFullName,
    required this.garageId,
    required this.garageName,
    required this.driverCardId,
    required this.driverCardNumber,
    required this.financialLog,
  });

  factory SmartCardTransactionHistory.fromJson(Map<String, dynamic> json) {
    return SmartCardTransactionHistory(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      smartCardId: json['smartCardId'],
      smartCardNumber: json['smartCardNumber'],
      vehicleId: json['vehicleId'],
      plateNumber: json['plateNumber'],
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
      plateCharacterId: json['plateCharacterId'],
      plateCharacterName: json['plateCharacterName'],
      action: json['action'],
      amount: json['amount'],
      userId: json['userId'],
      userFullName: json['userFullName'],
      garageId: json['garageId'],
      garageName: json['garageName'],
      driverCardId: json['driverCardId'],
      driverCardNumber: json['driverCardNumber'],
      financialLog: FinancialLog.fromJson(json['financialLog']),
    );
  }
}

class FinancialLog {
  String id;
  DateTime creationDate;
  bool deleted;
  int gate;
  int queue;
  int manifest;
  int parking;
  String vehicleMovementId;
  String vehicleId;
  String plateNumber;
  int type;
  int number;
  double totalPrice;

  FinancialLog({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.gate,
    required this.queue,
    required this.manifest,
    required this.parking,
    required this.vehicleMovementId,
    required this.vehicleId,
    required this.plateNumber,
    required this.type,
    required this.number,
    required this.totalPrice,
  });

  factory FinancialLog.fromJson(Map<String, dynamic> json) {
    return FinancialLog(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      gate: json['gate'],
      queue: json['queue'],
      manifest: json['manifest'],
      parking: json['parking'],
      vehicleMovementId: json['vehicleMovementId'],
      vehicleId: json['vehicleId'],
      plateNumber: json['plateNumber'],
      type: json['type'],
      number: json['number'],
      totalPrice: json['totalPrice'],
    );
  }
}
