import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddProduct extends StatelessWidget {
  AddProduct({super.key});

  final TextEditingController nameController = TextEditingController();

  final TextEditingController priceController = TextEditingController();

  final TextEditingController imageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Add Product', style: TextStyle(color: Colors.black)),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          children: [
            TextFormField(
              controller: nameController,

              decoration: InputDecoration(
                hintText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              controller: priceController,

              decoration: InputDecoration(
                hintText: 'Price',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 20),

            TextFormField(
              controller: imageController,

              decoration: InputDecoration(
                hintText: 'Image URL',
                border: OutlineInputBorder(),
              ),
            ),

            SizedBox(height: 30),

            SizedBox(
              width: double.infinity,
              height: 55,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  backgroundColor: Colors.black,
                ),

                onPressed: () async {
                  await FirebaseFirestore.instance.collection('products').add({
                    "name": nameController.text,
                    "price": priceController.text,
                    "image": imageController.text,
                  });

                  Get.back();

                  Get.snackbar(
                    'Success',
                    'Product Added',
                    backgroundColor: Colors.green,
                    colorText: Colors.white,
                  );
                },

                child: Text(
                  'ADD PRODUCT',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
