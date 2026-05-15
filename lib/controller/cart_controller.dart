import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> cartItems = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchCartItems();
  }

  Future<void> fetchCartItems() async {
    FirebaseFirestore.instance.collection('cart').snapshots().listen((
      snapshot,
    ) {
      cartItems.value = snapshot.docs.map((doc) {
        return {
          'id': doc.id,
          'name': doc['name'],
          'price': doc['price'],
          'image': doc['image'],
          'quantity': doc['quantity'],
        };
      }).toList();
    });
  }

  Future<void> addToCart({
    required String name,
    required String price,
    required String image,
  }) async {
    await FirebaseFirestore.instance.collection('cart').add({
      'name': name,
      'price': price,
      'image': image,
      'quantity': 1,
    });
  }

  Future<void> increaseQuantity(String id) async {
    final item = cartItems.firstWhere((element) => element['id'] == id);

    int quantity = item['quantity'];

    quantity++;

    await FirebaseFirestore.instance.collection('cart').doc(id).update({
      'quantity': quantity,
    });
  }

  Future<void> decreaseQuantity(String id) async {
    final item = cartItems.firstWhere((element) => element['id'] == id);

    int quantity = item['quantity'];

    if (quantity > 1) {
      quantity--;

      await FirebaseFirestore.instance.collection('cart').doc(id).update({
        'quantity': quantity,
      });
    }
  }

  Future<void> deleteItem(String id) async {
    await FirebaseFirestore.instance.collection('cart').doc(id).delete();
  }

  double totalPrice() {
    double total = 0;

    for (var item in cartItems) {
      String priceString = item['price'].toString().replaceAll('\$', '');

      double price = double.tryParse(priceString) ?? 0;

      int quantity = item['quantity'];

      total += price * quantity;
    }

    return total;
  }
}
