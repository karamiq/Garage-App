class City {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  Governorate governorate;

  City({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
    required this.governorate,
  });

  factory City.fromJson(Map<String, dynamic> json) {
    return City(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
      governorate: Governorate.fromJson(json['governorate']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deleted': deleted,
      'name': name,
      'governorate': governorate.toJson(),
    };
  }
}

////////////////////////////////////////////////////////////////////////////////

class Governorate {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;

  Governorate({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
  });

  factory Governorate.fromJson(Map<String, dynamic> json) {
    return Governorate(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deleted': deleted,
      'name': name,
    };
  }
}
