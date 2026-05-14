import 'package:flutter/material.dart';
import 'package:furniture_app/cart.dart';
import 'package:furniture_app/controller/cart_controller.dart';
import 'package:furniture_app/favourites.dart';
import 'package:get/get.dart';

class Product extends StatelessWidget {
  final CartController controller = Get.put(CartController());
  final String image;

  final String name;
  final String price;

  Product({
    super.key,

    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Align(
              alignment: Alignment.topRight,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.back();
                    },

                    child: Container(
                      width: 323,
                      height: 425,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(40),
                        ),

                        image: DecorationImage(
                          image: NetworkImage(image),

                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 20,
                    left: -20,
                    child: SizedBox(
                      height: 50,
                      width: 50,

                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        color: Colors.white,
                        child: Center(
                          child: Icon(Icons.arrow_back_ios, size: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                name,

                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    price,

                    style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.increment(1);
                          },

                          child: Image.asset('assets/images/plus.png'),
                        ),

                        const SizedBox(width: 10),

                        Text(
                          controller.quantityList[1].toString().padLeft(2, '0'),

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

                          child: Image.asset('assets/images/minus.png'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                children: [
                  Icon(Icons.star, color: Colors.amber, size: 30),
                  SizedBox(width: 10),
                  Text(
                    '4.5',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(width: 10),
                  Text(
                    '(50 reviews)',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Minimal Stand is made of by natural wood. The design that is very simple and minimal. This is truly one of the best furnitures in any family for now. With 3 different colors, you can easily select the best match for your home. ',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              ),
            ),
            SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(Favourites());
                    },
                    child: Image.asset('assets/images/fav2.png'),
                  ),
                  SizedBox(
                    height: 60,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusGeometry.circular(10),
                        ),
                        backgroundColor: Colors.black,
                      ),
                      onPressed: () {
                        Get.to(Cart());
                      },
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
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
    );
  }
}
