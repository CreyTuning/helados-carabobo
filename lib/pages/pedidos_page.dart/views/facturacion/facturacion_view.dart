import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'facturacion_view_controller.dart';

class SeleccionarDatosFacturacionView extends StatelessWidget {
  const SeleccionarDatosFacturacionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    FacturacionController facturacionController = Get.put(FacturacionController());

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Facturar'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: facturacionController.done,
                icon: const Icon(Icons.done)
              ),
            )
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Numero de Factura
              TextFormField(
                controller: facturacionController.numeroFactura,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                ],
                
                decoration: const InputDecoration(
                  labelText: 'Numero de la Factura',
                  border: OutlineInputBorder(),
                )
              ),

              const SizedBox(
                height: 25,
              ),

              // Valor del dolar
              TextFormField(
                controller: facturacionController.valorDolar,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9]+[,.]{0,1}[0-9]*')),
                  TextInputFormatter.withFunction(
                    (oldValue, newValue) => newValue.copyWith(
                      text: newValue.text.replaceAll('.', ','),
                    ),
                  ),
                ],
                
                decoration: const InputDecoration(
                  prefixText: 'Bs. ',
                  labelText: 'Cotización del Dolar',
                  border: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(15),
                  ),
                )
              )
            ],
          ),
        )
      ),
    );
  }
}