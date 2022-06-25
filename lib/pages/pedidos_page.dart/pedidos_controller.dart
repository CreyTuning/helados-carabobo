import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pedido.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/views/seleccionar_cliente/seleccionar_cliente_view.dart';
import 'package:mispedidos/pages/solicitudes_page/solicitudes_page.dart';

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
    Get.to(()=> const SolicitudesPage(), arguments: cliente);
  }

  double getPagado(){
    
    double total = 0;

    if(facturasController.facturas['$id']!.value.pedidos.isNotEmpty){
      facturasController.facturas['$id']!.value.pedidos.forEach((key, value) {
        total += value.pagado.value;
      });
    }

    return total;
  }

  void agregarPedido() async {

    var cliente = await Get.dialog(const SeleccionarClienteView());

    if(cliente != null){
      Pedido pedido = Pedido(cliente: cliente);
      pedido.fecha = DateTime.now().obs;
      facturasController.facturas['$id']!.value.pedidos[cliente] = pedido;
    }
  }

  void facturar(){
    facturasController.facturas['$id']!.value.estado.value += 1;
    Get.forceAppUpdate();
  }

  void onFacturarTap(){
    Get.generalDialog(
      pageBuilder: (context, animation, secondaryAnimation){
        return const Padding(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 500),
          child: SeleccionarDatosFacturacionView(),
        );
      },
    );
  }

  void onRemoveTap() {
    // Get.back(closeOverlays: true);
    // Get.forceAppUpdate();
    // facturasController.facturas.remove('$id');
  }
}