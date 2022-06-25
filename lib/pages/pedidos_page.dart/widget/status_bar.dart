import 'package:flutter/material.dart';

class StatusBar extends StatelessWidget {
  const StatusBar({
    Key? key,
    required this.onTap,
    required this.estado,
    }) : super(key: key);

    final Function onTap;
    final int estado;

  @override
  Widget build(BuildContext context) {

    Widget statusbar = Container();

    // Sin Facturar
    if(estado == 0){
      statusbar = InkWell(
        onTap: (){onTap();},
        child: Container(
          height: 25,
          width: double.infinity,
          color: Colors.orange[700],
          child: const Center(child:Text('Sin facturar')),
        ),
      );
    }

    // Sin entregar
    else if(estado == 1){
      statusbar = InkWell(
        onTap: (){onTap();},
        child: Container(
          height: 25,
          width: double.infinity,
          color: Colors.blue,
          child: const Center(child:Text('Pedidos sin entregar')),
        ),
      );
    }

    // Clientes con deuda
    else if(estado == 2){
      statusbar = InkWell(
        onTap: (){onTap();},
        child: Container(
          height: 25,
          width: double.infinity,
          color: Colors.red,
          child: const Center(child:Text('Clientes con deuda')),
        ),
      );
    }

    // Clientes con deuda
    else if(estado == 3){
      statusbar = InkWell(
        onTap: (){onTap();},
        child: Container(
          height: 25,
          width: double.infinity,
          color: Colors.red,
          child: const Center(child:Text('Factura sin pagar')),
        ),
      );
    }

    // Pagado
    else if(estado == 4){
      statusbar = InkWell(
        onTap: (){onTap();},
        child: Container(
          height: 25,
          width: double.infinity,
          color: Colors.green,
          child: const Center(child:Text('Finalizado')),
        ),
      );
    }
    
    return statusbar;
    
  }
}