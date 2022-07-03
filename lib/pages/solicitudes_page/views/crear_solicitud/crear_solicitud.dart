import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/crear_solicitud_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/widgets/sin_sabores_tile.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/widgets/solicitud_tile.dart';

class CrearSolicitud extends StatelessWidget {
  const CrearSolicitud({
    Key? key,
    required this.esNueva,
    this.producto,
    this.solicitudes = const <Solicitud>[],
    this.descuento = 0.0
  }) : super(key: key);

  final bool esNueva;
  final Producto? producto;
  final List<Solicitud> solicitudes;
  final double descuento;

  @override
  Widget build(BuildContext context) {

    CrearSolicitudController crearSolicitudController = Get.put(CrearSolicitudController());

    if(esNueva != true){
      if(producto != null){
        crearSolicitudController.producto.value = producto as Producto;
      }

      crearSolicitudController.solicitudes.value = solicitudes;
      crearSolicitudController.descuento.value = descuento;
    }


    return Obx(
      () => Scaffold(

        appBar: AppBar(
          title: InkWell(
            borderRadius: BorderRadius.circular(12),
            onTap: (){crearSolicitudController.onSeleccionarProductoTap();},
            child: Container(
              height: 50,
              alignment: Alignment.centerLeft,
              child: Text((crearSolicitudController.producto.value != Productos.nulo) ? crearSolicitudController.producto.value.nombre : 'Seleccionar producto'),
            ),
          ),

          actions: [
            (crearSolicitudController.producto.value.sabores == null) ? const SizedBox() : IconButton(
              onPressed: (crearSolicitudController.obtenerSaboresUsados().length == crearSolicitudController.producto.value.sabores!.length) ? null : (){crearSolicitudController.onAgregarSaborTap(context, crearSolicitudController.producto.value);},
              icon: const Icon(Icons.add)
            )
          ],

          leadingWidth: (crearSolicitudController.producto.value == Productos.nulo) ? 60 : 70,
          titleSpacing: (crearSolicitudController.producto.value == Productos.nulo) ? 12 : 5,
          leading: IconButton(
            onPressed: Get.back,
            icon: InkWell(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(Icons.arrow_back_rounded),
                  (crearSolicitudController.producto.value == Productos.nulo) ? const SizedBox() : Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    height: 30,
                    width: 30,
                    child: Image.asset(
                      'lib/resources/productos/${crearSolicitudController.producto.value.nombre}.png',
                    ),
                  ),
                  
                ],
              ),
            )
          ),
        ),

        bottomNavigationBar: SizedBox(
          height: 45,
          child: MaterialButton(
            onPressed: crearSolicitudController.onAceptarTap,
            color: Colors.green[700],
            // shape: RoundedRectangleBorder(
            //   borderRadius: BorderRadius.circular(30)
            // ),
            child: const Center(
              child: Text('Aceptar',)
            ),
          ),
        ),
    
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Producto

            (crearSolicitudController.producto.value != Productos.nulo) ? const SizedBox() : Center(
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
            (crearSolicitudController.producto.value == Productos.nulo || crearSolicitudController.producto.value.sabores != null) ? const SizedBox() : Padding(
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
            (crearSolicitudController.producto.value == Productos.nulo || crearSolicitudController.producto.value.sabores != null) ? const SizedBox() : Expanded(
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
                      onTap: (){crearSolicitudController.onSeleccionarCantidadTap(context, crearSolicitudController.producto.value);},
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
                                Text('${crearSolicitudController.cantidad.value}'),
                                (crearSolicitudController.producto.value.paqueteCantidad == null) ? Text((crearSolicitudController.cantidad.value == 1) ? ' Unidad' : ' Unidades') : Text(' ${(crearSolicitudController.cantidad.value == 1) ? ' Paquete' : ' Paquetes'} | ${crearSolicitudController.producto.value.paqueteCantidad! * crearSolicitudController.cantidad.value} unidades')
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
            (crearSolicitudController.producto.value == Productos.nulo || crearSolicitudController.producto.value.sabores == null) ? const SizedBox() : Expanded(
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
                          
                      child: (crearSolicitudController.solicitudes.isEmpty) ? const SinSaboresTile() : ListView.builder(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 20),
                        itemExtent: 45,
                        itemCount: crearSolicitudController.solicitudes.length,
                        itemBuilder: (context, index) => Material(
                          color: Colors.transparent,
                          child: SolicitudTile(
                            producto: crearSolicitudController.producto.value,
                            sabor: crearSolicitudController.solicitudes[index].sabor.value!,
                            cantidad: crearSolicitudController.solicitudes[index].cantidad.value!,
                            descuento: crearSolicitudController.solicitudes[index].descuento!.value!,
                            onProductoTap: (){crearSolicitudController.onEditarSaborTap(index);},
                            onCantidadTap: (){crearSolicitudController.onEditarCantidadTap(index);},
                            onProductoDobleTap: (){crearSolicitudController.onBorrarSaborTap(index);},
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
                    color: Colors.grey[900],
                    child: Row(
                      children: [
                        Expanded(child: Center(child: Text('${crearSolicitudController.obtenerCantidadDeUnidadesSolicitudes()}', style: TextStyle(fontSize: 14),))),

                        Expanded(child: Center(child: Text('${crearSolicitudController.descuento}\$', style: TextStyle(fontSize: 14),))),

                        Expanded(child: Center(child: Text('${crearSolicitudController.obtenerValorTotalDeSolicitudes().toStringAsFixed(2)}\$', style: TextStyle(fontSize: 14),))),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}