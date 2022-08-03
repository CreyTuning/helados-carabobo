import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pedido.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/views/overview_factura/overview_factura.dart';
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

  void onOverviewTap(){
    Get.to(()=> const OverviewFactura(), arguments: facturasController.facturas['$id']!);
  }

  void onPedidoTileTap(Cliente cliente){
    Get.to(()=> const EntradasPage(), arguments: cliente);
  }

  double getPagado(){
    
    double total = 0;

    if(facturasController.facturas['$id']!.pedidos.isNotEmpty){
      facturasController.facturas['$id']!.pedidos.forEach((cliente, pedido) {
        total += pedido.pagado;
      });
    }

    return total;
  }

  double getAdeudadoEmpresa(){
    
    double total = 0;

    if(facturasController.facturas['$id']!.pedidos.isNotEmpty){
      facturasController.facturas['$id']!.pedidos.forEach((cliente, pedido) {
        total += pedido.obtenerValorDeFabrica();
      });
    }

    return total;
  }

  void removerPedido(Cliente cliente){
    Get.defaultDialog(
      radius: 10,
      title: 'Eliminar pedido',
      middleText: 'Estas eliminando un pedido\n¿Deseas continuar?',
      actions: [

        OutlinedButton(
          child: const Text('Cancelar', style: TextStyle(color: Colors.white,)),
          onPressed: (){
            Get.back();
          }
        ),

        ElevatedButton(
          onPressed: (){
            facturasController.facturas['$id']!.pedidos.remove(cliente);
            update();
            facturasController.update();
            Get.back();
          },
          child: const Text('Eliminar')
        ),
        
      ]
    );
  }

  void agregarPedido() async {

    Cliente? cliente = await Get.dialog(const SeleccionarClienteView());

    if(cliente != null){
      Pedido pedido = Pedido(cliente: cliente);
      pedido.fecha = DateTime.now();
      facturasController.facturas['$id']!.pedidos.addAll({cliente : pedido});
    }

    update();
    facturasController.update();
  }

  void onFacturarTap() async {

    Map? valores = await Get.to(() => const SeleccionarDatosFacturacionView());

    if(valores != null){
      facturasController.facturas['$id']!.numero = valores['numeroFactura'];
      facturasController.facturas['$id']!.valorDelDolar = valores['valorDolar'];
      facturasController.facturas['$id']!.estado += 1;

      facturasController.facturas['$id']!.pedidos.forEach((cliente, pedido) {
        pedido.valorDelDolar = valores['valorDolar'];
      });
    }

    update();
    facturasController.update();
  }
}