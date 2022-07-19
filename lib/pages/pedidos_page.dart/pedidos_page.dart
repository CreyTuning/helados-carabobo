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

    PedidosController pedidosController = Get.put(PedidosController());
    FacturasController facturasController = Get.find();

    return Obx(
      () => Scaffold(

        appBar: AppBar(
          title: Text( (facturasController.facturas['${pedidosController.id}']!.value.numero.value == 0) ? 'Nueva Factura' : 'Factura #${facturasController.facturas['${pedidosController.id}']!.value.numero.value}'),
          bottom: PreferredSize(
            preferredSize: const Size(0, 25),
            child: StatusBar(onTap: (){}, estado: facturasController.facturas['${pedidosController.id}']!.value.estado.value)
          ),

          actions: [
            
            (facturasController.facturas['${pedidosController.id}']!.value.estado.value  == 0) ? IconButton(
              onPressed: pedidosController.agregarPedido,
              icon: const Icon(Icons.add)
            ) : const SizedBox(),
          ]
        ),

        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: MyFloatingButton(
          pedidosLenght: facturasController.facturas['${pedidosController.id}']!.value.pedidos.length,
          estado: facturasController.facturas['${pedidosController.id}']!.value.estado.value,
          facturar: pedidosController.onFacturarTap,
        ),

        body: (facturasController.facturas['${pedidosController.id}']!.value.pedidos.isEmpty) ? const EmptyList(label: 'Sin pedidos') : ListView.builder(
          itemCount: facturasController.facturas['${pedidosController.id}']!.value.pedidos.length,
          itemBuilder: (context, index) => TilePedido(
            esPagado: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.esPagado.value,
            esEntregado: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.esEntregado.value,
            pagado: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.pagado.value,
            fecha: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.fecha.value,
            adeudado: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.obtenerValor(),
            ganancia: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.obtenerGanancia(),
            cliente: facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.cliente,
            onTap: (){
              pedidosController.onPedidoTileTap(facturasController.facturas['${pedidosController.id}']!.value.pedidos.entries.elementAt(facturasController.facturas['${pedidosController.id}']!.value.pedidos.length - 1 - index).value.value.cliente);
            },
          ),
        ),

        bottomNavigationBar: PedidosInformationBar(
          estado: facturasController.facturas['${pedidosController.id}']!.value.estado.value,
          ganancia: facturasController.facturas['${pedidosController.id}']!.value.obtenerGanancia(),
          pagado: pedidosController.getPagado(),
          adeudado: facturasController.facturas['${pedidosController.id}']!.value.obtenerValor(),
          valorDelDolar: facturasController.facturas['${pedidosController.id}']!.value.valorDelDolar.value,
        ),
      ),
    );
  }
}