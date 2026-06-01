import 'package:get/state_manager.dart';

class ShippingController extends GetxController {
  RxString fullname = 'danish abrar'.obs;
  RxString address = 'House no 74, 86/6R , Sahiwal '.obs;

  void saveaddress({required String name, required String newaddress}) {
    fullname.value = name;
    address.value = newaddress;
  }
}
