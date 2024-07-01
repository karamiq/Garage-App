class DriverWorkRequest {
  String driverId;
  String driverName;
  String driverPhoneNumber;
  String image;
  int state;
  String title;
  String content;
  String governorateId;
  String governorateName;

  DriverWorkRequest({
    required this.driverId,
    required this.driverName,
    required this.driverPhoneNumber,
    required this.image,
    required this.state,
    required this.title,
    required this.content,
    required this.governorateId,
    required this.governorateName,
  });

  factory DriverWorkRequest.fromJson(Map<String, dynamic> json) {
    return DriverWorkRequest(
      driverId: json['driverId'],
      driverName: json['driverName'],
      driverPhoneNumber: json['driverPhoneNumber'],
      image: json['image'],
      state: json['state'],
      title: json['title'],
      content: json['content'],
      governorateId: json['governorateId'],
      governorateName: json['governorateName'],
    );
  }
}
