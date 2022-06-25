import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';

class SeleccionarCantidad extends StatelessWidget {
  const SeleccionarCantidad({
    Key? key,
    required this.producto,
    required this.sabor
  }) : super(key: key);

  final Producto producto;
  final String? sabor;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 73,
        titleSpacing: 5,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: (){
              Get.back();
            },
            child: Row(
              children: [
                const Icon(Icons.arrow_back_rounded),
                const SizedBox(width: 3),
                Container(
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  height: 30,
                  width: 30,
                  child: Image.asset(
                    'lib/resources/productos/${producto.nombre}.png',
                  ),
                ),
              ],
            ),
          ),
        ),
        title: Text(producto.nombre),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              (sabor == null) ? const SizedBox() : Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // controller: facturacionController.numeroFactura,
                  initialValue: sabor,
                  readOnly: true,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  
                  decoration: const InputDecoration(
                    labelText: 'Sabor',
                    enabled: false,
                    border: OutlineInputBorder(),
                  )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // controller: facturacionController.numeroFactura,
                  initialValue: '1',
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                  ],
                  
                  decoration: const InputDecoration(
                    labelText: 'Cantidad',
                    border: OutlineInputBorder(),
                  )
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  // controller: facturacionController.numeroFactura,
                  initialValue: '0',
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
                    labelText: 'Descuento',
                    prefixText: '\$ ',
                    border: OutlineInputBorder(),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}