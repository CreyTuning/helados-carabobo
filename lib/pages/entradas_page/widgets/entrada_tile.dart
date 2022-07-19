import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/pages/entradas_page/entradas_controller.dart';

class EntradaTile extends StatelessWidget {
  const EntradaTile({
    Key? key,
    required this.producto,
    required this.entrada,
    required this.onTap
  }) : super(key: key);

  final Producto producto;
  final Entrada entrada;
  final Callback? onTap;

  Column saboresDeLaEntradaAColumn(BuildContext context){
    List<Widget> items = [];

    // Agregar items
    for (var solicitud in entrada.solicitudes) {
      items.add(
        Row(
          children: [
            Flexible(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.only(left: 33),
                child: Row(
                  children: [
                    Opacity(
                      opacity: 0.65,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                            
                        foregroundDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(
                            color: Colors.white,
                            width: 1
                          )
                        ),
                        height: 12,
                        width: 12,
                        child: Image.asset(
                          'lib/resources/sabores/${solicitud.sabor.value!.nombre}.png',
                        ),
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
                          Text(solicitud.sabor.value!.nombre, overflow: TextOverflow.ellipsis, softWrap: false, style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.65), fontSize: 12), )
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
                child: Text('${solicitud.cantidad}', style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.65), fontSize: 12), )
              )
            ),

            // Valor
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: (producto.paqueteCantidad == null) 
                    ? Text('${(solicitud.sabor.value!.precioVenta == null) ? (producto.precioVenta! * solicitud.cantidad.value!).toStringAsFixed(2) : (solicitud.sabor.value!.precioVenta! * solicitud.cantidad.value!).toStringAsFixed(2)}\$', style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.65), fontSize: 12), )
                    : Text('${(solicitud.sabor.value!.precioVenta == null) ? (producto.precioVenta! * solicitud.cantidad.value! * producto.paqueteCantidad!).toStringAsFixed(2) : (solicitud.sabor.value!.precioVenta! * solicitud.cantidad.value! * producto.paqueteCantidad!).toStringAsFixed(2)}\$', style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.65), fontSize: 12), )
              )
            ),
          ],                    
        ),
      );
    }

    return Column(
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {

    EntradasController entradasController = Get.find();


    return Stack(
      children: [

        Container(
          padding: const EdgeInsets.fromLTRB(8, 10, 8, 0),
          child: Column(
            children: [
              
              Row(
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
                              'lib/resources/productos/${producto.nombre}.png',
                            ),
                          ),
                              
                          const SizedBox(
                            width: 8,
                          ),
                    
                          Flexible(
                            child: Text(producto.nombre, overflow: TextOverflow.ellipsis, softWrap: false),
                          ),
                        ],
                      ),
                    ),
                  ),
        
                  // Cantidad
                  Expanded(
                    child: Container(
                      alignment: Alignment.center,
                      child: Text('${entradasController.obtenerCantidadDeUnidadesEntrada(producto, entrada)}')
                    )
                  ),
        
                  // Valor
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerRight,
                      child: Text('${entradasController.valorTotalDeLaEntrada(producto, entrada).toStringAsFixed(2)}\$')
                    )
                  ),
                ],                    
              ),
      
              (producto.sabores == null) 
                        ? const SizedBox()
                        : Padding(
                            padding: const EdgeInsets.only(top: 0.0),
                            child: saboresDeLaEntradaAColumn(context),
                        ),

              const SizedBox(height: 10,),
            
              const Divider(
                height: 0,
              )
            ],
          ),
        ),

        Positioned.fill(
          child: InkWell(
            onTap: onTap
          )
        )
      ]
    );
  }
}