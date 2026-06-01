import 'package:flutter/material.dart';
import 'package:furniture_app/controller/payment.controller.dart';
import 'package:get/get.dart';

class AddPayment extends StatelessWidget {
  AddPayment({super.key});

  final PaymentController paymentController = Get.put(PaymentController());

  final TextEditingController cardHolderController = TextEditingController();

  final TextEditingController cardNumberController = TextEditingController();

  final TextEditingController cvvController = TextEditingController();

  final TextEditingController expiryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          'Add payment method',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Image.asset('assets/images/Paymentcard3.png'),
                  SizedBox(height: 20),
                  Container(
                    width: 335,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          child: Text(
                            'CardHolder Name',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 44,
                          width: 300,
                          child: TextFormField(
                            controller: cardHolderController,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Ex: Bruno Pham',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    width: 335,
                    height: 80,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 5,
                          ),
                          child: Text(
                            'Card Number',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 44,
                          width: 300,
                          child: TextFormField(
                            controller: cardNumberController,
                            keyboardType: TextInputType.number,
                            maxLength: 16,

                            decoration: InputDecoration(
                              counterText: '',

                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                              ),

                              hintText: '**** **** **** 3456',
                              hintStyle: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(height: 20),
                        Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.grey[100],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 5,
                                ),
                                child: Text(
                                  'CVV',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 44,
                                width: 300,
                                child: TextFormField(
                                  controller: cvvController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 03,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: 'Ex: 123',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 40),
                        SizedBox(height: 20),
                        Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.white,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 5,
                                ),
                                child: Text(
                                  'Expiration Date',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 44,
                                width: 300,
                                child: TextFormField(
                                  controller: expiryController,
                                  keyboardType: TextInputType.number,
                                  maxLength: 5,
                                  decoration: InputDecoration(
                                    counterText: '',
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide.none,
                                    ),
                                    hintText: '03/22',
                                    hintStyle: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 60,
              width: 335,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {
                  if (cardNumberController.text.length != 16) {
                    Get.snackbar('Error', 'Card Number must be 16 digits');
                    return;
                  }

                  if (cvvController.text.length != 3) {
                    Get.snackbar('Error', 'CVV must be 3 digits');
                    return;
                  }

                  if (expiryController.text.length != 5) {
                    Get.snackbar('Error', 'Expiry Date format should be MM/YY');
                    return;
                  }

                  paymentController.cardHolderName.value = cardHolderController
                      .text
                      .trim();

                  paymentController.cardNumber.value = cardNumberController.text
                      .trim();

                  paymentController.cvv.value = cvvController.text.trim();

                  paymentController.expiryDate.value = expiryController.text
                      .trim();

                  Get.back();
                },

                child: Text(
                  'ADD NEW CARD',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
