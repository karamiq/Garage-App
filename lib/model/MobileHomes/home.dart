import 'package:Trip/model/MobileHomes/last_trips.dart';

class Home {
  List<SmartCard> smartCards;
  int violationNumber;
  int tripsNumber;
  int notificationNumber;
  LastTrips lastTrips;

  Home({
    required this.smartCards,
    required this.violationNumber,
    required this.tripsNumber,
    required this.notificationNumber,
    required this.lastTrips,
  });

  factory Home.fromJson(Map<String, dynamic> json) {
    return Home(
      smartCards: (json['smartCards'])
          .map((e) => SmartCard.fromJson(e))
          .toList(),
      violationNumber: json['violationNumber'],
      tripsNumber: json['tripsNumber'],
      notificationNumber: json['notificationNumber'],
      lastTrips: LastTrips.fromJson(json['lastTrips']),
    );
  }
}

class SmartCard {
  String id;
  double amount;
  int status;
  String smartCardNumber;
  DateTime expiredDate;

  SmartCard({
    required this.id,
    required this.amount,
    required this.status,
    required this.smartCardNumber,
    required this.expiredDate,
  });

  factory SmartCard.fromJson(Map<String, dynamic> json) {
    return SmartCard(
      id: json['id'],
      amount: json['amount'],
      status: json['status'],
      smartCardNumber: json['smartCardNumber'],
      expiredDate: DateTime.parse(json['expiredDate']),
    );
  }
}
