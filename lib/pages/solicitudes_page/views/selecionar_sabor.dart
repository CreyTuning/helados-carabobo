import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/entradas_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_producto/seleccionar_producto_controller.dart';

class SeleccionarSabor extends StatelessWidget {
  const SeleccionarSabor({
    Key? key,
    required this.producto,
    required this.excluir
  }) : super(key: key);

  final Producto producto;
  final List<Sabor> excluir;

  @override
  Widget build(BuildContext context) {

    PedidosController pedidosController = Get.find();
    FacturasController facturasController = Get.find();
    EntradasController solicitudesController = Get.find();
    SeleccionarProductoController seleccionarProductoController = Get.put(SeleccionarProductoController());
    
    List<Sabor> saboresDisponibles = [];

    // Excluir sabores
    if(producto.sabores != null){

      for (Sabor sabor in producto.sabores!) {
        if(!excluir.contains(sabor)){
          saboresDisponibles.add(sabor);
        }
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar sabor'),
      ),

      body: ListView.builder(
        padding: const EdgeInsets.only(top: 5),
        itemExtent: 50,
        itemCount: saboresDisponibles.length,
        itemBuilder: (context, index) => InkWell(
          onTap: (){
            Get.back(result: saboresDisponibles[index]);
          },
          child: Container(
            padding: const EdgeInsets.fromLTRB(12, 5, 12, 5),
            child: Row(
              children: [
                Container(
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
                    'lib/resources/sabores/${saboresDisponibles[index].nombre}.png',
                  ),
                ),

                const SizedBox(
                  width: 5,
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(saboresDisponibles[index].nombre),
                    (saboresDisponibles[index].categoria == null) ? const SizedBox() : Text(saboresDisponibles[index].categoria!, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.65)),)
                  ],
                ),

                const Spacer(),

                Center(
                  child: Text('${(saboresDisponibles[index].precioVenta == null) ? producto.precioVenta : saboresDisponibles[index].precioVenta}\$'),
                )
              ],
            ),
          )
        ),
      ),
    );
  }
}