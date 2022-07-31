import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/pages/clientes_page/clientes_controller.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';

class SeleccionarClienteController extends GetxController {
  List<Cliente> clientesDisponibles = <Cliente>[];

  @override
  void onInit() {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    ClientesController clientesController = Get.find();
    
    // Agregar los clientes que aun no tiene un pedido registrado
    clientesController.clientes.forEach((int key, Cliente cliente){
      if(!facturasController.facturas['${pedidosController.id}']!.pedidos.keys.contains(cliente)){
        clientesDisponibles.insert(0, cliente);
      }
    });

    super.onInit();
  }

  void onClienteTap(int index){
    Get.back(result: clientesDisponibles[index]);
  }
}