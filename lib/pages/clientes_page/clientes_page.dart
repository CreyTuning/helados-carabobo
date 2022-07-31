import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/pages/clientes_page/clientes_controller.dart';

class ClientesPage extends StatelessWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ClientesController clientesController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
      ),

      body: ListView.builder(
        itemCount: clientesController.clientes.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(clientesController.clientes.entries.elementAt(index).value.nombre),
          leading: CircleAvatar(
            child: Text('${clientesController.clientes.entries.elementAt(index).key + 1}'),
          ),
        ),
      ),
    );
  }
}