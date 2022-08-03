import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/database/database.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_page.dart';

class FacturasController extends GetxController{

  int idCount = 0;
  int month = DateTime.now().month;
  int year = DateTime.now().year;
  Map<String, Factura> facturas = {};

  @override
  void onReady() async {
    await Database.init();
    facturas = await Database.loadFacturas(month: DateTime.now().month, year: DateTime.now().year) ?? {};
    idCount = await Database.loadIdCount();
    update();
    super.onReady();
  }

  void onSaveTap(){
    Database.saveFacturas(facturas: facturas, month: month, year: year);
    Database.saveIdCount(idCount);
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