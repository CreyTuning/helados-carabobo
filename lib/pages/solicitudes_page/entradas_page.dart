import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/widgets/empty_list.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/entradas_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/widgets/solicitudes_information_bar.dart';

class EntradasPage extends StatelessWidget {
  const EntradasPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    PedidosController pedidosController = Get.find();
    FacturasController facturasController = Get.find();
    EntradasController solicitudesController = Get.put(EntradasController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text(facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.cliente.nombre),
          actions: [
            (facturasController.facturas['${pedidosController.id}']!.value.estado > 0) ? const SizedBox() : IconButton(
              onPressed: solicitudesController.onAgregarTap,
              icon: const Icon(Icons.add)
            )
          ],
        ),
    
        bottomNavigationBar: SolicitudesInformationBar(
          adeudado: facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.adeudado.value,
          pagado: facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.pagado.value,
          ganancia: facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.ganancia.value,
          valorDelDolar: facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.valorDelDolar.value,
        ),
    
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    
        body: (facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.entradas.isEmpty) ? const EmptyList(label: 'Sin solicitudes') : ListView.builder(
          itemCount: facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.entradas.entries.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(facturasController.facturas['${pedidosController.id}']!.value.pedidos[solicitudesController.cliente]!.entradas.entries.elementAt(index).key.nombre),
          )
        ),
      ),
    );
  }
}