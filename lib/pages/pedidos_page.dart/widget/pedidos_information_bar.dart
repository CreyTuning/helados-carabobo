import 'package:flutter/material.dart';

class PedidosInformationBar extends StatelessWidget {
  const PedidosInformationBar({
    Key? key,
    required this.estado,
    required this.adeudado,
    required this.adeudadoEmpresa,
    // required this.pagado,
    required this.ganancia,
    required this.valorDelDolar
  }) : super(key: key);

  final int estado;
  final double adeudado;
  final double adeudadoEmpresa;
  // final double pagado;
  final double ganancia;
  final double valorDelDolar;

  @override
  Widget build(BuildContext context) {

    Color? color;

    switch (estado) {
      case 0:
        color = Colors.orange[700];
        break;
      case 1:
        color = Colors.blue;
        break;
      case 2:
        color = Colors.red;
        break;
      case 3:
        color = Colors.red;
        break;
      case 4:
        color = Colors.green;
        break;
    }

    return Container(
      height: 55,
      decoration: BoxDecoration(
        color: color,
        boxShadow: const [
          BoxShadow(
            blurRadius: 4,
            color: Colors.black,
          )
        ]
      ),

      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceAround,

          children: [
            
            // // Pagado
            // Column(
            //   // crossAxisAlignment: CrossAxisAlignment.stretch,
            //   mainAxisAlignment: MainAxisAlignment.spaceAround,
            //   children: [
            //     const Text('Pagado', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            //     Text('${pagado.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14))
            //   ],
            // ),

            // Dolar
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Dolar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('${valorDelDolar.toStringAsFixed(2)} Bs', style: const TextStyle(fontSize: 14))
              ],
            ),

            // Ganancia
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Ganancia', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('${ganancia.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14))
              ],
            ),

            // Adeudado
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Empresa', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('${adeudadoEmpresa.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14))
              ],
            ),

            // Adeudado
            Column(
              // crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('Total', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                Text('${adeudado.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14))
              ],
            ),
          ],
        ),
      ),
    );
  }
}