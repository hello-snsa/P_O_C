class ShoppingDataModel {
  String? name;
  int? price;
  String? image;

  ShoppingDataModel({
    this.name,
    this.price,
    this.image,
  });

  ShoppingDataModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    image = json['image'];
  }
}
