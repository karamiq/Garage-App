class TripScreen {
  String garageName;
  String toGarageName;
  String exitTime;
  String arrivedTime;
  String tripDuration;
  int manifest;
  int queue;
  int parking;
  int taxes;
  int totalAmount;
  DateTime tripDate;

  TripScreen({
    required this.garageName,
    required this.toGarageName,
    required this.exitTime,
    required this.arrivedTime,
    required this.tripDuration,
    required this.manifest,
    required this.queue,
    required this.parking,
    required this.taxes,
    required this.totalAmount,
    required this.tripDate,
  });

  factory TripScreen.fromJson(Map<String, dynamic> json) {
    return TripScreen(
      garageName: json['garageName'],
      toGarageName: json['toGarageName'],
      exitTime: json['exitTime'],
      arrivedTime: json['arrivedTime'],
      tripDuration: json['tripDuration'],
      manifest: json['manifest'],
      queue: json['queue'],
      parking: json['parking'],
      taxes: json['texes'], // Corrected from 'texes' to 'taxes'
      totalAmount: json['totalAmount'],
      tripDate: DateTime.parse(json['tripDate']),
    );
  }
}
