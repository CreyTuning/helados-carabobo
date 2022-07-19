import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pedido.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/views/seleccionar_cliente/seleccionar_cliente_view.dart';
import 'package:mispedidos/pages/entradas_page/entradas_page.dart';

import 'views/facturacion/facturacion_view.dart';

class PedidosController extends GetxController {
  
  FacturasController facturasController = Get.find();
  int id = 0;
  
  @override
  void onInit() {
    id = Get.arguments;
    super.onInit();
  }

  void onPedidoTileTap(Cliente cliente){
    Get.to(()=> const EntradasPage(), arguments: cliente);
  }

  @override
  void onClose() {
    facturasController.forceUpdate();
    Get.back();
    super.onClose();
  }

  double getPagado(){
    
    double total = 0;

    if(facturasController.facturas['$id']!.value.pedidos.isNotEmpty){
      facturasController.facturas['$id']!.value.pedidos.forEach((cliente, pedido) {
        total += pedido.value.pagado.value;
      });
    }

    return total;
  }

  void agregarPedido() async {

    Rx<Cliente>? cliente = await Get.dialog(const SeleccionarClienteView());

    if(cliente != null){
      Rx<Pedido> pedido = Pedido(cliente: cliente.value).obs;
      pedido.value.fecha = DateTime.now().obs;
      facturasController.facturas['$id']!.value.pedidos.addAll({cliente : pedido});
      // facturasController.facturas['$id']!.value.pedidos[cliente]!.value = pedido;
    }
  }

  void onFacturarTap() async {

    Map? valores = await Get.to(() => const SeleccionarDatosFacturacionView());

    if(valores != null){
      facturasController.facturas['$id']!.value.numero.value = valores['numeroFactura'];
      facturasController.facturas['$id']!.value.valorDelDolar.value = valores['valorDolar'];
      facturasController.facturas['$id']!.value.estado.value += 1;

      facturasController.facturas['$id']!.value.pedidos.forEach((cliente, pedido) {
        pedido.value.valorDelDolar.value = valores['valorDolar'];
      });

      Get.forceAppUpdate();
    }
  }

  void onRemoveTap() {
    // Get.back(closeOverlays: true);
    // Get.forceAppUpdate();
    // facturasController.facturas.remove('$id');
  }
}