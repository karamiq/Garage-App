class LastTrips {
  int weeklyTripNumber;
  double weeklyTripPercentage;
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
      tripHistory: (json['tripHistory'] as List<dynamic>)
          .map((e) => TripHistory.fromJson(e))
          .toList(),
    );
  }
}

class TripHistory {
  String id;
  DateTime creationDate;
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
  double taxes;
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
      creationDate: DateTime.parse(json['creationDate']),
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
}

class FinancialLogDto {
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
