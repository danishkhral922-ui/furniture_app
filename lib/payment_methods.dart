import 'package:flutter/material.dart';
import 'package:furniture_app/add_payment.dart';
import 'package:furniture_app/controller/check_controller.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class PaymentMethods extends StatelessWidget {
  PaymentMethods({super.key});
  final CheckController controller = Get.put(CheckController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
        centerTitle: true,
        title: Text(
          'Payment Methods',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.black,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset('assets/images/Paymentcard.png'),
            Obx(
              () => Row(
                children: [
                  Checkbox(
                    value: controller.check1.value,
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    onChanged: (value) {
                      controller.check1.value = value!;
                    },
                  ),
                  Text(
                    'Use as default payment method',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: controller.check1.value
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: controller.check1.value
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/images/Paymentcard2.png'),
            Obx(
              () => Row(
                children: [
                  Checkbox(
                    checkColor: Colors.white,
                    activeColor: Colors.black,
                    value: controller.check2.value,
                    onChanged: (value) {
                      controller.check2.value = value!;
                    },
                  ),
                  Text(
                    'Use as default payment method',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: controller.check2.value
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: controller.check2.value
                          ? Colors.black
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,

        child: Icon(Icons.add, color: Colors.black),

        onPressed: () {
          Get.to(AddPayment());
        },
      ),
    );
  }
}
