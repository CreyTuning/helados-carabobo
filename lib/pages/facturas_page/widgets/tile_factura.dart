import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';

class TileFactura extends StatelessWidget {
  const TileFactura({
    Key? key,
    required this.onTap,
    required this.onLongPress,
    required this.numero,
    required this.id,
    required this.estado,
    required this.adeudado,
    required this.ganancia,
    }) : super(key: key);

    final Callback onTap;
    final Callback onLongPress;
    final int numero;
    final int id;
    final int estado;
    final double adeudado;
    final double ganancia;

  @override
  Widget build(BuildContext context) {

    Widget tile = const ListTile();

    // Sin Facturar
    if(estado == 0){
      tile = ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: (numero == 0) ? Text('Nueva factura ($id)') : Text('Factura #$numero'),
        subtitle: const Text('Sin facturar'),        
        leading: CircleAvatar(
          backgroundColor: Colors.orange[700],
          child: const Icon(Icons.access_time, color: Colors.white),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${adeudado.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('${ganancia.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green))
          ],
        )
      );
    }

    // Sin entregar
    else if(estado == 1){
      tile = ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: (numero == 0) ? const Text('Nueva factura') : Text('Factura #$numero'),
        subtitle: const Text('Pedidos sin entregar'),        
        leading: const CircleAvatar(
          backgroundColor: Colors.blue,
          child: Icon(Icons.delivery_dining_rounded, color: Colors.white),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('${adeudado.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('${ganancia.toStringAsFixed(2)}\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green))
          ],
        )
      );
    }

    // Tus clientes no han pagado
    else if(estado == 2){
      tile = ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: (numero == 0) ? const Text('Nueva factura') : Text('Factura #$numero'),
        subtitle: const Text('Clientes con deuda'),     
        leading: const CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.money_off, color: Colors.white),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$adeudado\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('$ganancia\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green))
          ],
        )
      );
    }

    // No haz pagado la factura
    else if(estado == 3){
      tile = ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: (numero == 0) ? const Text('Nueva factura') : Text('Factura #$numero'),
        subtitle: const Text('Factura sin pagar'),
        leading: const CircleAvatar(
          backgroundColor: Colors.red,
          child: Icon(Icons.account_balance_wallet_rounded, color: Colors.white),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$adeudado\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('$ganancia\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green))
          ],
        )
      );
    }

    // Pagado
    else if(estado == 4){
      tile = ListTile(
        onTap: onTap,
        onLongPress: onLongPress,
        title: (numero == 0) ? const Text('Nueva factura') : Text('Factura #$numero'),
        subtitle: const Text('Finalizado'),        
        leading: const Hero(
          tag: 'icon',
          child: CircleAvatar(
            backgroundColor: Colors.green,
            child: Icon(Icons.attach_money_rounded, color: Colors.white),
          ),
        ),
        trailing: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$adeudado\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
            Text('$ganancia\$', style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.green))
          ],
        )
      );
    }
    
    return tile;
    
  }
}