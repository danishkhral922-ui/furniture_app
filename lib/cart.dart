import 'package:flutter/material.dart';
import 'package:furniture_app/checkout.dart';
import 'package:furniture_app/controller/cart_controller.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  Cart({super.key});

  final CartController controller = Get.put(CartController());

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
          child: const Icon(Icons.arrow_back_ios),
        ),

        title: const Text(
          'My Cart',

          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black,
          ),
        ),

        centerTitle: true,
      ),

      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15),

                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.asset('assets/images/minimalstand2.png'),

                        const SizedBox(width: 20),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'Minimal Stand',

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const Text(
                              '\$ 25.00',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 25),

                            Obx(
                              () => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.increment(0);
                                    },

                                    child: Image.asset(
                                      'assets/images/plus.png',
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Text(
                                    controller.quantityList[0]
                                        .toString()
                                        .padLeft(2, '0'),

                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  GestureDetector(
                                    onTap: () {
                                      controller.decrement(0);
                                    },

                                    child: Image.asset(
                                      'assets/images/minus.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Image.asset(
                          'assets/images/cancel.png',
                          color: Colors.black,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Divider(color: Colors.grey[200], thickness: 2),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.asset('assets/images/coffeetable2.png'),

                        const SizedBox(width: 20),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'Coffee Table',

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const Text(
                              '\$ 20.00',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 25),

                            Obx(
                              () => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.increment(1);
                                    },

                                    child: Image.asset(
                                      'assets/images/plus.png',
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Text(
                                    controller.quantityList[1]
                                        .toString()
                                        .padLeft(2, '0'),

                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,

                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  GestureDetector(
                                    onTap: () {
                                      controller.decrement(1);
                                    },

                                    child: Image.asset(
                                      'assets/images/minus.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Image.asset(
                          'assets/images/cancel.png',
                          color: Colors.black,
                        ),
                      ],
                    ),

                    const SizedBox(height: 20),

                    Divider(color: Colors.grey[200], thickness: 2),

                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Image.asset('assets/images/minimaldesk2.png'),

                        const SizedBox(width: 20),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            const Text(
                              'Minimal Desk',

                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                              ),
                            ),

                            const Text(
                              '\$ 50.00',

                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            const SizedBox(height: 25),

                            Obx(
                              () => Row(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      controller.increment(2);
                                    },

                                    child: Image.asset(
                                      'assets/images/plus.png',
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  Text(
                                    controller.quantityList[2]
                                        .toString()
                                        .padLeft(2, '0'),

                                    style: const TextStyle(
                                      fontWeight: FontWeight.w700,

                                      fontSize: 16,
                                    ),
                                  ),

                                  const SizedBox(width: 10),

                                  GestureDetector(
                                    onTap: () {
                                      controller.decrement(2);
                                    },

                                    child: Image.asset(
                                      'assets/images/minus.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),

                        const Spacer(),

                        Image.asset(
                          'assets/images/cancel.png',
                          color: Colors.black,
                        ),
                      ],
                    ),

                    const SizedBox(height: 100),

                    Row(
                      children: [
                        Card(
                          color: Colors.white,

                          child: SizedBox(
                            height: 44,
                            width: 276,

                            child: TextFormField(
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),

                                hintText: 'Enter Your Promo Code',

                                hintStyle: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),

                        Container(
                          height: 44,
                          width: 44,

                          decoration: BoxDecoration(
                            color: Colors.black,

                            borderRadius: BorderRadius.circular(5),
                          ),

                          child: const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,

                      children: [
                        Text(
                          'Total :',

                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),

                        Text(
                          '\$ 95.00',

                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: SizedBox(
              height: 60,
              width: 335,

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),

                  backgroundColor: Colors.black,
                ),

                onPressed: () {
                  Get.to(Checkout());
                },

                child: const Text(
                  'Check Out',

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
