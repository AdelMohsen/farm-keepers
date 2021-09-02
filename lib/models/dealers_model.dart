class DealersModel {
  int? id;
  String? name;
  String? phone;
  String? purchasingPower;
  String? country;
  String? city;
  String? image;

  DealersModel(
      {this.id,
      required this.name,
      required this.phone,
      required this.purchasingPower,
      required this.country,
      required this.city,
      required this.image});

  Map<String,dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phoneNumber': phone,
      'purchasingPower': purchasingPower,
      'country': country,
      'city': city,
      'image': image
    };
  }

  DealersModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    name = map['name'];
    phone = map['phoneNumber'];
    purchasingPower = map['purchasingPower'];
    country = map['country'];
    city = map['city'];
    image = map['image'];
  }
}
