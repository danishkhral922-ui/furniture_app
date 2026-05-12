import 'package:flutter/material.dart';
import 'package:furniture_app/home.dart';
import 'package:furniture_app/orders.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';

class Congrats extends StatelessWidget {
  const Congrats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 20),
            Center(
              child: Text(
                'Sucess!',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(height: 20),
            Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset('assets/images/sucesspic1.png'),
                Positioned(
                  right: 20,
                  bottom: 20,
                  child: Image.asset('assets/images/sucesspic.png'),
                ),
                Positioned(
                  bottom: -30,
                  right: 110,
                  child: Image.asset('assets/images/checkmark.png'),
                ),
              ],
            ),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Center(
                child: Text(
                  'Your order will be delivered soon.Thank you for choosing our app!',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
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
                  Get.to(Orders());
                },
                child: Text(
                  'Track Yours Orders',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
            SizedBox(
              height: 60,
              width: 335,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  ),
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Get.off(Home());
                },
                child: Text(
                  'BACK TO HOME',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
