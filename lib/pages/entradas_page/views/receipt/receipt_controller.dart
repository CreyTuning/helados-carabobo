import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/overviewItem.dart';
import 'package:mispedidos/objects/pedido.dart';
import 'package:mispedidos/objects/solicitud.dart';

class ReceiptController extends GetxController {
  late Pedido pedido;
  List<OverviewItem> overviewItems = [];

  Color colorBack = Colors.white;
  Color colorfront = Colors.grey[800] as Color;
  double textSizeDivision = 25;

  @override
  void onInit() {
    pedido = Get.arguments;
    super.onInit();
  }

  Future<List<List<String>>> getEntradas() async {

    List<List<String>> entradas = [];
    
    pedido.entradas.forEach((producto, entrada) {
      
      if(entrada.solicitudes.isEmpty){
        entradas.add(
          [producto.nombre, entrada.cantidad.toString(), '${(entrada.cantidad * producto.precioVenta! * (producto.paqueteCantidad ?? 1)).toStringAsFixed(2)}\$']
        );
      }

      else{
        for (Solicitud solicitud in entrada.solicitudes) {
          entradas.add(
            ['${producto.nombre} ${solicitud.sabor!.nombre}', solicitud.cantidad.toString(), '${(solicitud.cantidad! * (solicitud.sabor!.precioVenta ?? producto.precioVenta!) * (producto.paqueteCantidad ?? 1)).toStringAsFixed(2)}\$']
          );
        }
      }

    });

    return entradas;
  }
 
}