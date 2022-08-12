import 'package:flutter/material.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';

class SolicitudTile extends StatelessWidget {
  const SolicitudTile({
    Key? key,
    required this.sabor,
    required this.cantidad,
    required this.descuento,
    required this.producto,
    required this.onProductoTap,
    required this.onCantidadTap,
    required this.onLongPress
    
  }) : super(key: key);

  final Sabor sabor;
  final int cantidad;
  final double descuento;
  final Producto producto;
  final Function onProductoTap;
  final Function onLongPress;
  final Function onCantidadTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Contenido
        Positioned.fill(
          child: Container(
            padding: const EdgeInsets.fromLTRB(8, 5, 8, 5),
            child: Row(
              children: [
        
                Flexible(
                  flex: 3,
                  child: Container(
                    child: Row(
                      children: [
                        Container(
                          clipBehavior: Clip.antiAlias,
                          
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                          ),
                              
                          foregroundDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                              color: Colors.white,
                              width: 2
                            )
                          ),
                          height: 25,
                          width: 25,
                          child: Image.asset(
                            'lib/resources/sabores/${sabor.nombre}.png',
                          ),
                        ),
                            
                        const SizedBox(
                          width: 8,
                        ),
                  
                        Flexible(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(sabor.nombre, overflow: TextOverflow.ellipsis, softWrap: false),
                              (sabor.categoria == null) ? const SizedBox() : const SizedBox(height: 2),
                              (sabor.categoria == null) ? const SizedBox() : Text(sabor.categoria!, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.65)),)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        
                // Cantidad
                Expanded(
                  child: Container(
                    alignment: Alignment.center,
                    child: Text('$cantidad')
                  )
                ),
        
                // Valor
                Expanded(
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: (producto.paqueteCantidad == null) 
                    ? Text('${(sabor.precioVenta == null) ? (producto.precioVenta! * cantidad).toStringAsFixed(2) : (sabor.precioVenta! * cantidad).toStringAsFixed(2)}\$')
                    : Text('${(sabor.precioVenta == null) ? (producto.precioVenta! * cantidad * producto.paqueteCantidad!).toStringAsFixed(2) : (sabor.precioVenta! * cantidad * producto.paqueteCantidad!).toStringAsFixed(2)}\$')
                  )
                ),
        
                
              ],
            ),
          ),
        ),
        

        // InkWell
        Positioned.fill(
          child: Material(
            color: Colors.transparent,
            child: Row(
              children: [
                Expanded(
                  flex: 10,
                  child: InkWell(
                    borderRadius: const BorderRadius.only(topRight: Radius.circular(30), bottomRight: Radius.circular(30)),
                    onTap: (){onProductoTap();},
                    onLongPress: (){onLongPress();},
                  ),
                ),
          
                Expanded(
                  flex: 6,
                  child: InkWell(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), bottomLeft: Radius.circular(30)),
                    onTap: (){onCantidadTap();},
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }
}