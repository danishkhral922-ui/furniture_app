import 'package:flutter/material.dart';
import 'package:furniture_app/cart.dart';
import 'package:furniture_app/controller/bottomvav_controller.dart';
import 'package:furniture_app/favourites.dart';
import 'package:furniture_app/notificaions.dart';
import 'package:furniture_app/product.dart';
import 'package:furniture_app/profile.dart';
import 'package:get/get.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final BottomNavController controller = Get.put(BottomNavController());

  @override
  Widget build(BuildContext context) {
    final List<Widget> screens = [
      homeContent(),

      Favourites(),

      Notificaions(),

      Profile(),
    ];

    return Obx(
      () => Scaffold(
        body: screens[controller.currentIndex.value],

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          showSelectedLabels: false,

          showUnselectedLabels: false,

          currentIndex: controller.currentIndex.value,

          type: BottomNavigationBarType.fixed,

          selectedItemColor: Colors.black,

          unselectedItemColor: Colors.grey,

          onTap: (index) {
            controller.currentIndex.value = index;
          },

          items: [
            BottomNavigationBarItem(
              icon: Icon(
                controller.currentIndex.value == 0
                    ? Icons.home
                    : Icons.home_outlined,
              ),

              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                controller.currentIndex.value == 1
                    ? Icons.favorite
                    : Icons.favorite_border,
              ),

              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                controller.currentIndex.value == 2
                    ? Icons.notifications
                    : Icons.notifications_none,
              ),

              label: '',
            ),

            BottomNavigationBarItem(
              icon: Icon(
                controller.currentIndex.value == 3
                    ? Icons.person
                    : Icons.person_outline,
              ),

              label: '',
            ),
          ],
        ),
      ),
    );
  }

  Widget homeContent() {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          FirebaseFirestore.instance.collection('products').add({
            "image":
                "https://images.unsplash.com/photo-1505693416388-ac5ce068fe85",
            'name': 'New Chair',
            'price': '\$ 15.00',
          });
        },
      ),

      appBar: AppBar(
        surfaceTintColor: Colors.white,
        backgroundColor: Colors.white,

        elevation: 0,

        leading: const Icon(Icons.search, color: Colors.black),

        centerTitle: true,

        title: const Column(
          mainAxisSize: MainAxisSize.min,

          children: [
            Text(
              'Make Home',

              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),

            Text(
              'BEAUTIFUL',

              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        actions: [
          Padding(
            padding: EdgeInsets.only(right: 15),

            child: GestureDetector(
              onTap: () {
                Get.to(Cart());
              },
              child: Image.asset(
                'assets/images/cart.png',
                width: 24,
                height: 24,
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset('assets/images/fav.png', width: 40),
                    const SizedBox(height: 5),
                    const Text(
                      'Popular',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/chair.png', width: 40),
                    const SizedBox(height: 5),
                    const Text(
                      'Chair',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/table.png', width: 40),
                    const SizedBox(height: 5),
                    const Text(
                      'Table',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/sofa.png', width: 40),
                    const SizedBox(height: 5),
                    const Text(
                      'Armchair',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Image.asset('assets/images/bed.png', width: 40),
                    const SizedBox(height: 5),
                    const Text(
                      'Bed',
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),

              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, snapshots) {
                  if (!snapshots.hasData) {
                    return Center(child: CircularProgressIndicator());
                  }
                  var data = snapshots.data!.docs;
                  return GridView.builder(
                    itemCount: data.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 20,
                          childAspectRatio: 0.62,
                          crossAxisCount: 2,
                        ),
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Get.to(
                            Product(
                              image: data[index]['image'],
                              name: data[index]['name'],
                              price: data[index]['price'],
                            ),
                          );
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Stack(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          data[index]['image'],
                                        ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Image.asset(
                                      'assets/images/shoppingbag2.png',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data[index]['name'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              data[index]['price'],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
