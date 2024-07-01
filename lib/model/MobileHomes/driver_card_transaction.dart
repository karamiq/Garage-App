class DriverCardTransaction {
  String id;
  DateTime creationDate;
  bool deleted;
  int number;
  double amount;
  String driverCardId;
  String driverCardNumber;
  String driverName;
  String destDriverCardId;
  int destDriverCardNumber;
  String destDriverName;
  DateTime transactionDate;
  String title;
  String description;
  int transactionType;
  String userId;
  String userFullName;
  String smartCardId;
  String smartCardNumber;

  DriverCardTransaction({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.number,
    required this.amount,
    required this.driverCardId,
    required this.driverCardNumber,
    required this.driverName,
    required this.destDriverCardId,
    required this.destDriverCardNumber,
    required this.destDriverName,
    required this.transactionDate,
    required this.title,
    required this.description,
    required this.transactionType,
    required this.userId,
    required this.userFullName,
    required this.smartCardId,
    required this.smartCardNumber,
  });

  factory DriverCardTransaction.fromJson(Map<String, dynamic> json) {
    return DriverCardTransaction(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      number: json['number'],
      amount: json['amount'],
      driverCardId: json['driverCardId'],
      driverCardNumber: json['driverCardNumber'],
      driverName: json['driverName'],
      destDriverCardId: json['destDriverCardId'],
      destDriverCardNumber: json['destDriverCardNumber'],
      destDriverName: json['destDriverName'],
      transactionDate: DateTime.parse(json['transactionDate']),
      title: json['title'],
      description: json['description'],
      transactionType: json['transactionType'],
      userId: json['userId'],
      userFullName: json['userFullName'],
      smartCardId: json['smartCardId'],
      smartCardNumber: json['smartCardNumber'],
    );
  }
}
