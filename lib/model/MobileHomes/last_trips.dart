class LastTrips {
  int weeklyTripNumber;
  int weeklyTripPercentage;
  int totalTripNumber;
  List<TripHistory> tripHistory;

  LastTrips({
    required this.weeklyTripNumber,
    required this.weeklyTripPercentage,
    required this.totalTripNumber,
    required this.tripHistory,
  });

  factory LastTrips.fromJson(Map<String, dynamic> json) {
    return LastTrips(
      weeklyTripNumber: json['weeklyTripNumber'],
      weeklyTripPercentage: json['weeklyTripPercentage'],
      totalTripNumber: json['totalTripNumber'],
      tripHistory: List<TripHistory>.from(
          json['tripHistory'].map((x) => TripHistory.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'weeklyTripNumber': weeklyTripNumber,
      'weeklyTripPercentage': weeklyTripPercentage,
      'totalTripNumber': totalTripNumber,
      'tripHistory': List<dynamic>.from(tripHistory.map((x) => x.toJson())),
    };
  }
}

class TripHistory {
  String id;
  String creationDate;
  bool deleted;
  String gateId;
  String gateName;
  String garageId;
  String garageName;
  String toGarageId;
  String toGarageName;
  String vehicleId;
  String plateNumber;
  String plateCharacter;
  String plateGovernorate;
  int taxes;
  int action;
  FinancialLogDto financialLogDto;

  TripHistory({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.gateId,
    required this.gateName,
    required this.garageId,
    required this.garageName,
    required this.toGarageId,
    required this.toGarageName,
    required this.vehicleId,
    required this.plateNumber,
    required this.plateCharacter,
    required this.plateGovernorate,
    required this.taxes,
    required this.action,
    required this.financialLogDto,
  });

  factory TripHistory.fromJson(Map<String, dynamic> json) {
    return TripHistory(
      id: json['id'],
      creationDate: json['creationDate'],
      deleted: json['deleted'],
      gateId: json['gateId'],
      gateName: json['gateName'],
      garageId: json['garageId'],
      garageName: json['garageName'],
      toGarageId: json['toGarageId'],
      toGarageName: json['toGarageName'],
      vehicleId: json['vehicleId'],
      plateNumber: json['plateNumber'],
      plateCharacter: json['plateCharacter'],
      plateGovernorate: json['plateGovernorate'],
      taxes: json['taxes'],
      action: json['action'],
      financialLogDto: FinancialLogDto.fromJson(json['financialLogDto']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate,
      'deleted': deleted,
      'gateId': gateId,
      'gateName': gateName,
      'garageId': garageId,
      'garageName': garageName,
      'toGarageId': toGarageId,
      'toGarageName': toGarageName,
      'vehicleId': vehicleId,
      'plateNumber': plateNumber,
      'plateCharacter': plateCharacter,
      'plateGovernorate': plateGovernorate,
      'taxes': taxes,
      'action': action,
      'financialLogDto': financialLogDto.toJson(),
    };
  }
}

class FinancialLogDto {
  String id;
  String creationDate;
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
  int totalPrice;

  FinancialLogDto({
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

  factory FinancialLogDto.fromJson(Map<String, dynamic> json) {
    return FinancialLogDto(
      id: json['id'],
      creationDate: json['creationDate'],
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

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate,
      'deleted': deleted,
      'gate': gate,
      'queue': queue,
      'manifest': manifest,
      'parking': parking,
      'vehicleMovementId': vehicleMovementId,
      'vehicleId': vehicleId,
      'plateNumber': plateNumber,
      'type': type,
      'number': number,
      'totalPrice': totalPrice,
    };
  }
}
