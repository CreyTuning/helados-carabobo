import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_page.dart';

class FacturasController extends GetxController{

  Rx<int> idCount = 0.obs;
  RxMap<String, Rx<Factura>> facturas = <String, Rx<Factura>>{}.obs;

  void onFacturaTileTap(int id) {
    Get.to(() => const PedidosPage(), arguments: id);
  }

  void onNewFacturaTap(){
    facturas['${idCount.value}'] = Factura(id: idCount.value).obs;
    idCount.value++;
  }

  void onDismissedFactura(int index){
    facturas.remove('$index');
  }
}