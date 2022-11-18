import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'delivery_view_controller.dart';

class DeliveryView extends StatelessWidget {
  const DeliveryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    DeliveryController deliveryController = Get.put(DeliveryController());

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18)
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Delivery'),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: deliveryController.done,
                icon: const Icon(Icons.done)
              ),
            )
          ],
        ),

        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // Valor del delivery
              TextFormField(
                controller: deliveryController.valorEntrega,
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
                  suffixText: '\$',
                  labelText: 'Consto de entrega',
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