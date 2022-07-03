import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/crear_solicitud.dart';

import '../pedidos_page.dart/pedidos_controller.dart';

class EntradasController extends GetxController{
  Cliente cliente = Cliente(nombre: '');
  
  @override
  void onInit() {
    cliente = Get.arguments;
    super.onInit();
  }

  void onAgregarTap() async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    
    Map<Producto, Entrada>? mapEntrada = await Get.to(()=> const CrearSolicitud(esNueva: true));

    if(mapEntrada != null){
      facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[cliente]!.entradas.addAll(mapEntrada);
    }
  }
}