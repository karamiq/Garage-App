class PathType {
  String id;
  DateTime creationDate;
  bool deleted;
  String name;
  double price;
  bool hasManifest;

  PathType({
    required this.id,
    required this.creationDate,
    required this.deleted,
    required this.name,
    required this.price,
    required this.hasManifest,
  });

  factory PathType.fromJson(Map<String, dynamic> json) {
    return PathType(
      id: json['id'],
      creationDate: DateTime.parse(json['creationDate']),
      deleted: json['deleted'],
      name: json['name'],
      price: json['price'],
      hasManifest: json['hasManifest'],
    );
  }
}
