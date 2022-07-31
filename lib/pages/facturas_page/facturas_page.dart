import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/clientes_page/clientes_controller.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/widgets/empty_list.dart';

import 'widgets/tile_factura.dart';

class FacturasPage extends StatelessWidget {
  const FacturasPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ClientesController clientesController = Get.put(ClientesController());

    return GetBuilder<FacturasController>(
        init: FacturasController(),
        builder: (facturasController) => Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          label: const Text('Nueva factura'),
          onPressed: facturasController.onNewFacturaTap,
        ),
      
        appBar: AppBar(
          title: const Text('Facturas'),
        ),
      
        body: (facturasController.facturas.isEmpty)
        ? const EmptyList(label: 'Sin facturas')
        : ListView.builder(
          itemCount: facturasController.facturas.length,
          itemBuilder: (context, index) => TileFactura(
            id: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.id,
            numero: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.numero,
            adeudado: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.obtenerValor(),
            ganancia: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.obtenerGanancia(),
            estado: facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.estado,
            onTap: () => facturasController.onFacturaTileTap(facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.id),
            onLongPress: (){facturasController.onRemoveFactura(facturasController.facturas[facturasController.facturas.keys.elementAt(facturasController.facturas.length - 1 - index)]!.id);}
          ),
        )
      ),
    );
  }
}