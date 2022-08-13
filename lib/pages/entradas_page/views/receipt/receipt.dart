import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'receipt_controller.dart';

class Receipt extends StatelessWidget {
  const Receipt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    ReceiptController receiptController = Get.put(ReceiptController());

    return Scaffold(
      appBar: AppBar(),
      body: FutureBuilder<List<List<String>>>(
        future: receiptController.getEntradas(),
        builder: (context, snapshot) {

          late Widget result;

          if(!snapshot.hasData){
            result = const Center(child: CircularProgressIndicator());
          }

          else {
            result = Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('RECIBO DE COMPRA', style: TextStyle(fontSize: Get.size.width / 17, color: receiptController.colorfront, fontWeight: FontWeight.bold)),
                          Text('Helados Carabobo', style: TextStyle(fontSize: Get.size.width / 20, color: receiptController.colorfront)),
                          Text('RIF: J-29466945-0', style: TextStyle(fontSize: Get.size.width / 30, color: receiptController.colorfront)),
                        ],
                      ),

                      const Spacer(),

                      Image.asset('lib/resources/logo.png', height: Get.size.width / 5, filterQuality: FilterQuality.medium),
                    ],
                  ),

                  
                  Divider(height: 10, thickness: 1, color: receiptController.colorfront,),
                  
                  // Nombre del cliente
                  Row(
                    children: [
                      Text('Cliente: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      const Spacer(),
                      Text(receiptController.pedido.cliente.nombre, style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront)),
                    ],
                  ),
                  
                  // Nombre del vendedor
                  Row(
                    children: [
                      Text('Asesor: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      const Spacer(),
                      Text('Luis Romero', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront)),
                    ],
                  ),

                  // Nombre del vendedor
                  Row(
                    children: [
                      Text('Contacto: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      const Spacer(),
                      Text('+58 414-5943513', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront)),
                    ],
                  ),
                  
                  // fecha
                  Row(
                    children: [
                      Text('Fecha: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      const Spacer(),
                      Text('${receiptController.pedido.fecha.day}/${receiptController.pedido.fecha.month}/${receiptController.pedido.fecha.year}', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront)),
                    ],
                  ),

                  Divider(height: 10, thickness: 1, color: receiptController.colorfront,),

                  // barra de titulo con nomrbes
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(width: Get.size.width / 15, alignment: Alignment.centerLeft, child: Text('#', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold))),
                      Text('Producto', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold)),
                      const Spacer(),
                      SizedBox(width: Get.size.width / 9, child: Center(child: Text('Cant.', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold)))),
                      const SizedBox(width: 3),
                      Container(width: Get.size.width / 6.8, alignment: Alignment.centerRight, child: Text('Precio', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold))),
                    ],
                  ),

                  Flexible(
                    child:  ListView.builder(
                      itemCount: snapshot.data!.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(width: Get.size.width / 15, alignment: Alignment.centerLeft, child: Text('${index + 1}. ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold))),
                          Text(snapshot.data![index][0].replaceAll('Sundae Sundae', 'Sundae').replaceAll('4.4 Litros', '4.4L').replaceAll('Medio Litro', '1/2L'), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront)),
                          const Spacer(),
                          SizedBox(width: Get.size.width / 9, child: Center(child: Text(snapshot.data![index][1], style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront)))),
                          const SizedBox(width: 3),
                          Container(width: Get.size.width / 6.8, alignment: Alignment.centerRight, child: Text(snapshot.data![index][2].replaceAll('.0\$', '\$').replaceAll('.00\$', '\$'), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront))),
                        ]
                      ),
                    ),
                  ),

                  Divider(height: 10, thickness: 1, color: receiptController.colorfront,),

                  // tasa de cambio
                  Row(
                    children: [
                      const Spacer(flex: 10,),
                      Text('Tasa de cambio: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      Container(width: Get.size.width / 6, alignment: Alignment.centerRight, child: Text(receiptController.pedido.valorDelDolar.toStringAsFixed(2).replaceAll('.0', '').replaceAll('.00', ''), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront))),
                    ],
                  ),

                  // Descuento
                  Row(
                    children: [
                      const Spacer(flex: 10,),
                      Text('Descuento: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      Container(width: Get.size.width / 6, alignment: Alignment.centerRight, child: Text('${receiptController.pedido.descuento.toStringAsFixed(2)}\$'.replaceAll('.0\$', '\$').replaceAll('.00\$', '\$'), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront))),
                    ],
                  ),

                  // consto de envio
                  Row(
                    children: [
                      const Spacer(flex: 10,),
                      Text('Envio: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      Container(width: Get.size.width / 6, alignment: Alignment.centerRight, child: Text('${receiptController.pedido.constoEnvio.toStringAsFixed(2)}\$'.replaceAll('.0\$', '\$').replaceAll('.00\$', '\$'), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront))),
                    ],
                  ),

                  Divider(height: 10, thickness: 1, indent: Get.size.width / 2.15, color: receiptController.colorfront,),

                  // total
                  Row(
                    children: [
                      const Spacer(flex: 10,),
                      Text('Total: ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      Container(width: Get.size.width / 6, alignment: Alignment.centerRight, child: Text('${(receiptController.pedido.obtenerValor() + receiptController.pedido.constoEnvio - receiptController.pedido.descuento).toStringAsFixed(2)}\$'.replaceAll('.0\$', '\$').replaceAll('.00\$', '\$'), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: Colors.green[600], fontWeight: FontWeight.bold))),
                    ],
                  ),

                  // total en Bs
                  Row(
                    children: [
                      const Spacer(flex: 10,),
                      Text('Bs. ', style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront, fontWeight: FontWeight.bold),),
                      Container(width: Get.size.width / 6, alignment: Alignment.centerRight, child: Text(((receiptController.pedido.obtenerValor() + receiptController.pedido.constoEnvio - receiptController.pedido.descuento) * receiptController.pedido.valorDelDolar).toStringAsFixed(2).replaceAll('.0', '').replaceAll('.00', ''), style: TextStyle(fontSize: Get.size.width / receiptController.textSizeDivision, color: receiptController.colorfront))),
                    ],
                  ),
                 
                ],
              ),
            );
          }

          return result;
        },
      ),
    );
  }
}