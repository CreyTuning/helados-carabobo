import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/overviewItem.dart';
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
      extendBody: true,

      body: FutureBuilder<List<OverviewItem>>(
        future: overviewFacturaController.getOverviewItems(),
        builder: (context, snapshot) {

          late Widget result;

          if(!snapshot.hasData){
            result = const Center(child: CircularProgressIndicator());
          }

          else {
            result = ListView.builder(
              itemCount: snapshot.data!.length,
              itemExtent: 20,
              itemBuilder: (context, index) => ListTile(
                dense: true,
                title: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: '${index + 1}) '),
                      TextSpan(text: '${snapshot.data![index].producto} '),
                      TextSpan(text: snapshot.data![index].sabor, style: const TextStyle(color: Color.fromARGB(255, 250, 201, 133))),
                    ]
                  )
                ),

                trailing: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(text: snapshot.data![index].cantidad.toString()),
                      (snapshot.data![index].blister == true)
                        ? const TextSpan(text: ' b', style: TextStyle(color: Colors.lightBlueAccent))
                        : const TextSpan(text: ' u', style: TextStyle(color: Colors.lightGreenAccent))
                    ]
                  )
                )
              ),
            );
          }

          return result;
        },
      ),
    );
  }
}