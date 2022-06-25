import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/clientes_page/clientes_controller.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mispedidos/pages/widgets/empty_list.dart';

import 'widgets/tile_factura.dart';

class FacturasPage extends StatelessWidget {
  const FacturasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // ignore: unused_local_variable
    ClientesController clientesController = Get.put(ClientesController());
    FacturasController facturasController = Get.put(FacturasController());

    return Obx(
      ()=> Scaffold(

        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Nueva factura'),
          onPressed: facturasController.onNewFacturaTap,
        ),
    
        appBar: AppBar(
          title: const Text('Facturas'),
        ),
    
        body: (facturasController.facturas.isEmpty) ? const EmptyList(label: 'Sin facturas') : ListView.builder(
          itemCount: facturasController.facturas.length,
          itemBuilder: (context, index) => TileFactura(
            id: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.value.id,
            numero: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.value.numero.value,
            adeudado: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.value.adeudado.value,
            ganancia: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.value.ganancia.value,
            estado: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.value.estado.value,
            onTap: () => facturasController.onFacturaTileTap(facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.value.id)
          ),
        )
      ),
    );
  }
}