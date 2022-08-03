import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/pedidos_page.dart/views/overview_factura/overview_factura_controller.dart';

class OverviewFactura extends StatelessWidget {
  const OverviewFactura({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    OverviewFacturaController overviewFacturaController = Get.put(OverviewFacturaController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista previa'),
      ),
    );
  }
}