import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/database/database.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_page.dart';

class FacturasController extends GetxController{

  int idCount = 0;
  Map<String, Factura> facturas = {};

  @override
  void onInit() {
    Database.init();
    super.onInit();
  }

  void onFacturaTileTap(int id) {
    Get.to(() => const PedidosPage(), arguments: id);
  }

  void onNewFacturaTap(){
    facturas['$idCount'] = Factura(id: idCount);
    idCount++;
    update();
  }

  void onRemoveFactura(int index){
    Get.defaultDialog(
      radius: 10,
      title: 'Eliminar factura',
      middleText: 'Estas eliminando una factura ¿Deseas continuar?',
      actions: [

        OutlinedButton(
          child: const Text('Cancelar', style: TextStyle(color: Colors.white,)),
          onPressed: (){
            Get.back();
          }
        ),

        ElevatedButton(
          onPressed: (){
            facturas.remove('$index');
            update();
            Get.back();
          },
          child: const Text('Eliminar')
        ),
        
      ]
    );
  }
}