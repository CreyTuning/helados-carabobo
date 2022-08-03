import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/widget/floating_button.dart';
import 'package:mispedidos/pages/pedidos_page.dart/widget/pedidos_information_bar.dart';
import 'package:mispedidos/pages/pedidos_page.dart/widget/pedido_tile.dart';
import 'package:mispedidos/pages/widgets/empty_list.dart';

import 'widget/status_bar.dart';

class PedidosPage extends StatelessWidget {
  const PedidosPage({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FacturasController facturasController = Get.find();

    return GetBuilder<PedidosController>(
      init: PedidosController(),
      builder: (pedidosController) => Scaffold(
        appBar: AppBar(
          title: Text( (facturasController.facturas['${pedidosController.id}']!.numero == 0) ? 'Nueva Factura' : 'Factura #${facturasController.facturas['${pedidosController.id}']!.numero}'),
          bottom: PreferredSize(
            preferredSize: const Size(0, 25),
            child: StatusBar(onTap: (){}, estado: facturasController.facturas['${pedidosController.id}']!.estado)
          ),

          actions: [

            (facturasController.facturas['${pedidosController.id}']!.pedidos.isNotEmpty) ? IconButton(
              onPressed: pedidosController.onOverviewTap,
              icon: const Icon(Icons.remove_red_eye_outlined),
              tooltip: 'Vista previa'
            ) : const SizedBox(),
            
            (facturasController.facturas['${pedidosController.id}']!.estado  == 0) ? IconButton(
              onPressed: pedidosController.agregarPedido,
              icon: const Icon(Icons.add),
              tooltip: 'Agregar pedido'
            ) : const SizedBox(),
          ]
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyFloatingButton(
          pedidosLenght: facturasController.facturas['${pedidosController.id}']!.pedidos.length,
          estado: facturasController.facturas['${pedidosController.id}']!.estado,
          facturar: pedidosController.onFacturarTap,
        ),

        body: (facturasController.facturas['${pedidosController.id}']!.pedidos.isEmpty) ? const EmptyList(label: 'Sin pedidos') : ListView.builder(
          itemCount: facturasController.facturas['${pedidosController.id}']!.pedidos.length,
          itemBuilder: (context, index) => TilePedido(
            esPagado: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.esPagado,
            esEntregado: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.esEntregado,
            pagado: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.pagado,
            fecha: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.fecha,
            adeudado: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.obtenerValor(),
            ganancia: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.obtenerGanancia(),
            cliente: facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).value.cliente,
            onTap: (){
              pedidosController.onPedidoTileTap(facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).key);
            },
            onLongPress: (facturasController.facturas['${pedidosController.id}']!.estado != 0) ? null : (){
              pedidosController.removerPedido(facturasController.facturas['${pedidosController.id}']!.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.pedidos.length - 1 - index).key);
            },
          ),
        ),

        bottomNavigationBar: PedidosInformationBar(
          estado: facturasController.facturas['${pedidosController.id}']!.estado,
          ganancia: facturasController.facturas['${pedidosController.id}']!.obtenerGanancia(),
          // pagado: pedidosController.getPagado(),
          adeudado: facturasController.facturas['${pedidosController.id}']!.obtenerValor(),
          adeudadoEmpresa: pedidosController.getAdeudadoEmpresa(),
          valorDelDolar: facturasController.facturas['${pedidosController.id}']!.valorDelDolar,
        ),
      )
    );
  }
}