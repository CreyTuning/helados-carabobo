import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';

class FacturacionController extends GetxController {
  TextEditingController numeroFactura = TextEditingController();
  TextEditingController valorDolar = TextEditingController();

  void done(){
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();

    facturasController.facturas['${pedidosController.id}']!.value.numero.value = int.parse(numeroFactura.text);
    facturasController.facturas['${pedidosController.id}']!.value.valorDelDolar.value = double.parse(valorDolar.text.replaceAll(',', '.'));
    pedidosController.facturar();

    Get.back();
  }
}