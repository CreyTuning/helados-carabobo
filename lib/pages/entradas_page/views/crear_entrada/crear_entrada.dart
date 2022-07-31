import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/data/productos.dart';
import 'crear_entrada_controller.dart';
import 'widgets/sin_sabores_tile.dart';
import 'widgets/solicitud_tile.dart';

class CrearEntrada extends StatelessWidget {
  const CrearEntrada({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return GetBuilder<CrearEntradaController>(
      init: CrearEntradaController(),
      builder: (crearEntradaController) => Scaffold(
        appBar: AppBar(
          title: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (){crearEntradaController.onSeleccionarProductoTap();},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text((crearEntradaController.producto != Productos.nulo) ? crearEntradaController.producto.nombre : 'Seleccionar producto'),
            ),
          ),

          actions: [
            (crearEntradaController.producto.sabores == null) ? const SizedBox() : IconButton(
              onPressed: (crearEntradaController.obtenerSaboresUsados().length == crearEntradaController.producto.sabores!.length) ? null : (){crearEntradaController.onAgregarSaborTap(crearEntradaController.producto);},
              icon: const Icon(Icons.add)
            )
          ],

          leadingWidth: (crearEntradaController.producto == Productos.nulo) ? 60 : 70,
          titleSpacing: (crearEntradaController.producto == Productos.nulo) ? 12 : 5,
          leading: IconButton(
            onPressed: (){crearEntradaController.onBackTap();},
            icon: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back_rounded),
                  (crearEntradaController.producto == Productos.nulo) ? const SizedBox() : Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'lib/resources/productos/${crearEntradaController.producto.nombre}.png',
                    ),
                  ),
                  
                ],
              ),
            )
          ),
        ),

        bottomNavigationBar: crearEntradaController.esNuevoElProducto == false ? const SizedBox() : SizedBox(
          height: 45,
          child: MaterialButton(
            onPressed: crearEntradaController.onAceptarTap,
            color: Colors.green[700],
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(30)
            // ),
            child: const Center(
              child: Text('Agregar producto',)
            ),
          ),
        ),
    
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Producto

            (crearEntradaController.producto != Productos.nulo) ? const SizedBox() : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_upward_rounded, color:Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5), size: 50),
                  
                  const SizedBox(height: 5),
                  
                  Text(
                    'Toca para seleccionar un poducto',
                    style: TextStyle(
                        color: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .color!
                            .withOpacity(0.5)),
                  ),
                ],
              )
            ),

            // Seleccionar descuento General
            (crearEntradaController.producto == Productos.nulo || crearEntradaController.producto.sabores != null) ? const SizedBox() : Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8),
                    child: Text('Descuento'),
                  ),
        
                  InkWell(
                    borderRadius: BorderRadius.circular(30),
                    onTap: (){},
                    child: Container(
                      height: 45,
                  
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[700]!.withOpacity(0.7),
                      ),
                  
                      child: const SizedBox(
                        height: 45,
                        child: Center(child: Text('Agregar descuento'))
                      ),
                  
                    ),
                  ),
        
                ],
              ),
            ),
    
            // Cantidad (si el producto NO tiene sabores)
            (crearEntradaController.producto == Productos.nulo || crearEntradaController.producto.sabores != null) ? const SizedBox() : Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text('Cantidad'),
                    ),
                    
                    InkWell(
                      borderRadius: BorderRadius.circular(30),
                      onTap: (){crearEntradaController.onSeleccionarCantidadTap(crearEntradaController.producto);},
                      child: Container(
                        height: 45,
                    
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey[700]!.withOpacity(0.7),
                        ),
                    
                        child: SizedBox(
                          height: 45,
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('${crearEntradaController.cantidad}'),
                                (crearEntradaController.producto.paqueteCantidad == null) ? Text((crearEntradaController.cantidad == 1) ? ' Unidad' : ' Unidades') : Text(' ${(crearEntradaController.cantidad == 1) ? ' Paquete' : ' Paquetes'} | ${crearEntradaController.producto.paqueteCantidad! * crearEntradaController.cantidad} unidades')
                              ],
                            )
                          )
                        ),
                    
                      ),
                    ),
            
                    const SizedBox(height: 7),
                  ],
                ),
              ),
            ),

            // Agregar sabor (si el producto SI tiene sabores)
            (crearEntradaController.producto == Productos.nulo || crearEntradaController.producto.sabores == null) ? const SizedBox() : Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 25,
                    color: Colors.grey[700]!.withOpacity(0.1),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: const Text('Producto', 
                              style: TextStyle(
                                fontSize: 14
                              )
                            )
                          )
                        ),

                        Expanded(
                          child: Container(
                            alignment: Alignment.center,
                            child: const Text('Cantidad', 
                              style: TextStyle(
                                fontSize: 14
                              )
                            )
                          )
                        ),

                        Expanded(
                          child: Container(
                            alignment: Alignment.centerRight,
                            child: const Text('Valor', 
                              style: TextStyle(
                                fontSize: 14
                              )
                            )
                          )
                        ),
                      ],
                    ),
                  ),
                      
                  Expanded(
                    child: Container(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: BoxDecoration(
                        color: Colors.grey[900],
                      ),
                          
                      child: (crearEntradaController.solicitudes.isEmpty) ? const SinSaboresTile() : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                        itemExtent: 45,
                        itemCount: crearEntradaController.solicitudes.length,
                        itemBuilder: (context, index) => Material(
                          color: Colors.transparent,
                          child: SolicitudTile(
                            producto: crearEntradaController.producto,
                            sabor: crearEntradaController.solicitudes[index].sabor!,
                            cantidad: crearEntradaController.solicitudes[index].cantidad!,
                            descuento: crearEntradaController.solicitudes[index].descuento!,
                            onProductoTap: (){crearEntradaController.onEditarSaborTap(index);},
                            onCantidadTap: (){crearEntradaController.onEditarCantidadTap(index);},
                            onProductoDobleTap: (){crearEntradaController.onBorrarSaborTap(index);},
                          )
                        ),
                      )
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 25,
                    color: Colors.grey[700]!.withOpacity(0.1),
                    child: Row(
                      children: const [
                        Expanded(child: Center(child: Text('Cantidad', style: TextStyle(fontSize: 14),))),

                        Expanded(child: Center(child: Text('Descuento', style: TextStyle(fontSize: 14),))),

                        Expanded(child: Center(child: Text('Total', style: TextStyle(fontSize: 14),))),
                      ],
                    ),
                  ),

                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    height: 25,
                    color: Colors.grey[700]!.withOpacity(0.1),
                    child: Row(
                      children: [
                        Expanded(child: Center(child: Text('${crearEntradaController.obtenerCantidadDeUnidadesSolicitudes()}', style: TextStyle(fontSize: 14),))),

                        Expanded(child: Center(child: Text('${crearEntradaController.descuento}\$', style: TextStyle(fontSize: 14),))),

                        Expanded(child: Center(child: Text('${crearEntradaController.obtenerValorTotalDeSolicitudes().toStringAsFixed(2)}\$', style: TextStyle(fontSize: 14),))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )
    );
  }
}