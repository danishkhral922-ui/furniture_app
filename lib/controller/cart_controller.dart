import 'package:get/get.dart';

class CartController extends GetxController {
  RxList<int> quantityList = [1, 1, 1].obs;

  void increment(int index) {
    quantityList[index]++;
    quantityList.refresh();
  }

  void decrement(int index) {
    if (quantityList[index] > 1) {
      quantityList[index]--;
      quantityList.refresh();
    }
  }
}
