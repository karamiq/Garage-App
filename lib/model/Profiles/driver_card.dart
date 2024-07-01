//part of the profile model
class DriverCard {
  String id;
  DateTime creationDate;
  bool deleted;
  int number;
  int balance;
  String driverId;
  String driverFullName;
  DateTime expiredDate;
  int cardStatus;

  DriverCard({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.number,
    required this.balance,
    required this.driverId,
    required this.driverFullName,
    required this.expiredDate,
    required this.cardStatus,
  });

  factory DriverCard.fromJson(Map<String, dynamic> json) {
    return DriverCard(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      number: json['number'],
      balance: json['balance'],
      driverId: json['driverId'],
      driverFullName: json['driverFullName'],
      expiredDate: DateTime.parse(json['expiredDate']),
      cardStatus: json['cardStatus'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deleted': deleted,
      'number': number,
      'balance': balance,
      'driverId': driverId,
      'driverFullName': driverFullName,
      'expiredDate': expiredDate.toIso8601String(),
      'cardStatus': cardStatus,
    };
  }
}
