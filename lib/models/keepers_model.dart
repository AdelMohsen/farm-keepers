class KeepersModel {
  int? id;
  String? name;
  String? phone;
  String? farmNumber;
  String? motherCount;
  dynamic image;

  KeepersModel(
      {this.id,
      required this.name,
      required this.phone,
      required this.farmNumber,
      required this.motherCount,
      required this.image});

  Map<String,dynamic> toMap() => {
        'id': id,
        'name': name,
        'phoneNumber': phone,
        'farmNumber': farmNumber,
        'motherCount': motherCount,
        'image': image,
      };

  KeepersModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phoneNumber'];
    farmNumber = map['farmNumber'];
    motherCount = map['motherCount'];
    image = map['image'];
  }
}
