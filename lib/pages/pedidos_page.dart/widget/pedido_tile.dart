import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:mispedidos/objects/cliente.dart';

class TilePedido extends StatelessWidget {
  const TilePedido({
    Key? key,
    required this.onTap,
    required this.onLongPress,
    required this.esEntregado,
    required this.esPagado,
    required this.cliente, 
    required this.fecha,
    required this.ganancia,
    required this.adeudado,
    required this.pagado,
    }) : super(key: key);

    final Callback onTap;
    final Callback? onLongPress;
    final bool esEntregado;
    final bool esPagado;
    final Cliente cliente;
    final DateTime fecha;
    final double ganancia;
    final double adeudado;
    final double pagado;

  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: onTap,
      onLongPress: onLongPress,
      child: ListTile(
        title: Text(
          cliente.nombre,
          maxLines: 1,
          style: const TextStyle(
            overflow: TextOverflow.ellipsis,
          )
        ),
        subtitle: Text.rich(TextSpan(
          children: [
            WidgetSpan(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: (esEntregado == true) ? Colors.blue : Colors.grey[700],
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                  child: Text.rich(TextSpan(
                    children: [

                      WidgetSpan(
                        child: Icon(
                          Icons.delivery_dining_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),

                      TextSpan(
                        text: ' Entrega',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 0,
                        )
                      ),

                    ]
                  )),
                )
              )
            ),
            
            const WidgetSpan(child: SizedBox(width: 2)),
            
            WidgetSpan(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: (esPagado == true) ? Colors.green : Colors.grey[700],
                ),
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(6, 2, 6, 2),
                  child: Text.rich(TextSpan(
                    children: [

                      WidgetSpan(
                        child: Icon(
                          Icons.attach_money_rounded,
                          size: 15,
                          color: Colors.white,
                        ),
                      ),

                      TextSpan(
                        text: 'Pago',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          height: 0,
                        )
                      ),

                    ]
                  )),
                )
              )
            ),

            // WidgetSpan(child: SizedBox(width: 5)),
            // TextSpan(
            //   text:'hace ${DateTime.now().difference(fecha).inDays} dias',
            //   style: const TextStyle(
            //     overflow: TextOverflow.fade
            //   )
            // ),
          ]
        )),
        
        leading: CircleAvatar(
          backgroundColor: Colors.blueGrey,
          child: Text(cliente.nombre.substring(0, 1), style: const TextStyle(fontSize: 24, color: Colors.white)),
        ),
        
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${adeudado.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('${ganancia.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green))
          ],
        )
      ),
    );
  }
}