import 'package:get/get.dart';

class PaymentController extends GetxController {
  RxString cardHolderName = 'Danish Abrar'.obs;

  RxString cardNumber = '**** **** **** 3947'.obs;

  RxString cvv = '123'.obs;

  RxString expiryDate = '03/22'.obs;
}
