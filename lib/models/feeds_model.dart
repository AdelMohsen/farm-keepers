class FeedsModel {
  int? id;
  String? name;
  String? phone;
  String? checkerWeight;
  String? checkerPrice;

  FeedsModel(
      {this.id,required this.name,
      required this.phone,
      required this.checkerWeight,
      required this.checkerPrice});

  Map<String,dynamic> toMap() {
    return {
      'id':id,
      'name': name,
      'phone': phone,
      'checkerWeight': checkerWeight,
      'checkerPrice': checkerPrice
    };
  }

  FeedsModel.fromMap(Map<String, dynamic> map) {
    id=map['id'];
    name = map['name'];
    phone = map['phone'];
    checkerWeight = map['checkerWeight'];
    checkerPrice = map['checkerPrice'];
  }
}
