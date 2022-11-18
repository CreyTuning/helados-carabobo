import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class DeliveryController extends GetxController {
  TextEditingController valorEntrega = TextEditingController();

  void done(){
    Get.back(result: double.parse(valorEntrega.text.replaceAll(',', '.')));
  }
}