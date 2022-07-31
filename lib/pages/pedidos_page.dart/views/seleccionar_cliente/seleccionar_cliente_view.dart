import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/pedidos_page.dart/views/seleccionar_cliente/seleccionar_cliente_controller.dart';

class SeleccionarClienteView extends StatelessWidget {
  const SeleccionarClienteView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    SeleccionarClienteController seleccionarClienteController = Get.put(SeleccionarClienteController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleccionar Cliente'),
      ),

      body: ListView.builder(
        itemCount: seleccionarClienteController.clientesDisponibles.length,
        itemBuilder: (context, index) => ListTile(
          onTap: (){seleccionarClienteController.onClienteTap(index);},
          title: Text(seleccionarClienteController.clientesDisponibles[index].nombre),
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
        ),
      ),
    );
  }
}