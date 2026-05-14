import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  Future<void> addproduct() async {
    try {
      await firestore.collection('products').add({
        'name': nameController.text.trim(),
        'price': priceController.text.trim(),
        'image': imageController.text.trim(),
        'description': descriptionController.text.trim(),
        'createdAt': DateTime.now(),
      });
      Get.snackbar(
        'Success',
        'Product Added Sucessfully',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      nameController.clear();
      priceController.clear();
      imageController.clear();
      descriptionController.clear();
    } catch (e) {
      Get.snackbar(
        'Error',
        toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}
