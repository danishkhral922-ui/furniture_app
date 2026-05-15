import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:furniture_app/model/favourite_model.dart';
import 'package:get/get.dart';

class FavouriteController extends GetxController {

  RxList<FavouriteModel> favouriteItems =
      <FavouriteModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchFavourite();
  }

  void fetchFavourite() {

    FirebaseFirestore.instance
        .collection('favourite')
        .snapshots()
        .listen((snapshot) {

      favouriteItems.value =
          snapshot.docs.map((doc) {

        return FavouriteModel.fromMap(
          doc.data(),
          doc.id,
        );

      }).toList();
    });
  }

  Future<void> addToFavourite({
    required String name,
    required String price,
    required String image,
  }) async {

    await FirebaseFirestore.instance
        .collection('favourite')
        .add({

      'name': name,
      'price': price,
      'image': image,
    });
  }

  Future<void> removeFavourite(
    String id,
  ) async {

    await FirebaseFirestore.instance
        .collection('favourite')
        .doc(id)
        .delete();
  }
}