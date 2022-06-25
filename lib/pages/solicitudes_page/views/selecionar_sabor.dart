import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/solicitudes_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_producto/seleccionar_producto_controller.dart';

class SeleccionarSabor extends StatelessWidget {
  const SeleccionarSabor({
    Key? key,
    required this.producto
  }) : super(key: key);

  final Producto producto;

  @override
  Widget build(BuildContext context) {

    PedidosController pedidosController = Get.find();
    FacturasController facturasController = Get.find();
    SolicitudesController solicitudesController = Get.find();
    SeleccionarProductoController seleccionarProductoController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar sabor'),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.only(top: 5),
        itemCount: producto.sabores!.length,
        itemBuilder: (context, index) => ListTile(
          onTap: (){
            Get.back(result: producto.sabores![index].nombre);
          },
          title: Text(producto.sabores![index].nombre),
          leading: Container(
            clipBehavior: Clip.antiAlias,
            
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.white,
            ),

            foregroundDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                color: Colors.white,
                width: 2
              )
            ),
            height: 40,
            width: 40,
            child: Image.asset(
              'lib/resources/sabores/${producto.sabores![index].nombre}.png',
            ),
          ),
        ),
      ),
    );
  }
}