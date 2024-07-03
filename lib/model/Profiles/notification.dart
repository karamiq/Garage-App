class Notif {
  String id;
  bool deleted;
  DateTime creationDate;
  String notifyId;
  String title;
  String description;
  String picture;
  int notifyFor;
  DateTime date;
  String userId;
  bool isRead;
  int notificationDestination;

  Notif({
    required this.id,
    required this.deleted,
    required this.creationDate,
    required this.notifyId,
    required this.title,
    required this.description,
    required this.picture,
    required this.notifyFor,
    required this.date,
    required this.userId,
    required this.isRead,
    required this.notificationDestination,
  });

  // Factory method to create a Notification from JSON
  factory Notif.fromJson(Map<String, dynamic> json) {
    return Notif(
      id: json['id'],
      deleted: json['deleted'],
      creationDate: DateTime.parse(json['creationDate']),
      notifyId: json['notifyId'],
      title: json['title'],
      description: json['description'],
      picture: json['picture'],
      notifyFor: json['notifyFor'],
      date: DateTime.parse(json['date']),
      userId: json['userId'],
      isRead: json['isRead'],
      notificationDestination: json['notificationDestination'],
    );
  }

  // Method to convert a Notification instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'deleted': deleted,
      'creationDate': creationDate.toIso8601String(),
      'notifyId': notifyId,
      'title': title,
      'description': description,
      'picture': picture,
      'notifyFor': notifyFor,
      'date': date.toIso8601String(),
      'userId': userId,
      'isRead': isRead,
      'notificationDestination': notificationDestination,
    };
  }
}
