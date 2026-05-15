class CartModel {
  String id;
  String name;
  String price;
  String image;
  int quantity;

  CartModel({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json, String docId) {
    return CartModel(
      id: docId,
      name: json['name'],
      price: json['price'],
      image: json['image'],
      quantity: json['quantity'],
    );
  }
}
