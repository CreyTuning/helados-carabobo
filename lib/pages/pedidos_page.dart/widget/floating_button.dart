import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyFloatingButton extends StatelessWidget {
  const MyFloatingButton({
    Key? key,
    required this.estado,
    required this.facturar,
    required this.pedidosLenght
  }) : super(key: key);

  final int estado;
  final int pedidosLenght;
  final Function facturar;

  @override
  Widget build(BuildContext context) {
    Widget floatinButton = const SizedBox();

    if(estado == 0 && pedidosLenght > 0){
      floatinButton = FloatingActionButton.extended(
        onPressed: (){facturar();},
        label: const Text('Facturar')
      );
    }

    else if(estado == 0 && pedidosLenght == 0){
      floatinButton = FloatingActionButton.extended(
        onPressed: (){

          Get.dialog(Dialog(
            child: SizedBox(
              height: 195,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Factura vacia', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                
                body: const Padding(
                  padding: EdgeInsets.all(18.0),
                  child: Text('No puedes facturar sin pedidos. \n\nPresiona + para agregar nuevos pedidos.', style: TextStyle(fontSize: 16)),
                ),
              ),
            )
          ));
        },
        label: const Text('Facturar')
      );
    }

    return floatinButton;
  }
}