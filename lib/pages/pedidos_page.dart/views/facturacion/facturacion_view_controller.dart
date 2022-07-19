import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class FacturacionController extends GetxController {
  TextEditingController numeroFactura = TextEditingController();
  TextEditingController valorDolar = TextEditingController();

  void done(){
    Get.back(result:{
      'numeroFactura': int.parse(numeroFactura.text),
      'valorDolar': double.parse(valorDolar.text.replaceAll(',', '.'))
    });
  }
}