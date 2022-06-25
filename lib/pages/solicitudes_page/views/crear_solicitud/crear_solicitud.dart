import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/crear_solicitud_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/widgets/producto_nulo_tile.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/widgets/producto_sin_sabor_tile.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/widgets/sin_sabores_tile.dart';

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

    if(producto != null){
      crearSolicitudController.producto.value = producto as Producto;
    }

    crearSolicitudController.solicitudes.value = solicitudes;
    crearSolicitudController.descuento.value = descuento;


    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: Text((esNueva == true) ? 'Nueva solicitud' : 'Editar solicitud')
        ),
    
        body: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            // Producto
            const Padding(
              padding: EdgeInsets.only(bottom: 8),
              child: Text('Producto'),
            ),
    
            InkWell(
              borderRadius: BorderRadius.circular(30),
              onTap: () {
                crearSolicitudController.onSeleccionarProductoTap();
              },
              child: Container(
                height: 45,
            
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[700]!.withOpacity(0.7),
                ),
            
                child: Stack(
                  children: [
                    SizedBox(
                      height: 45,
                      child: Center(child: Text((crearSolicitudController.producto.value == Productos.nulo ? 'Seleccionar producto' : crearSolicitudController.producto.value.nombre)))
                    ),

                    (crearSolicitudController.producto.value == Productos.nulo) ? const SizedBox() :
                    Positioned(
                      top: 2.5,
                      left: 2,
                      child: Container(
                        clipBehavior: Clip.antiAlias,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,
                        ),
                        height: 40,
                        width: 40,
                        child: Image.asset(
                          'lib/resources/productos/${crearSolicitudController.producto.value.nombre}.png',
                        ),
                      ),
                    ),

                  ],
                ),
            
              ),
            ),
    
            const SizedBox(height: 7),
    
            // Seleccionar descuento
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
    
            const SizedBox(height: 7),
    
            // Agregar sabor
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8),
              child: Text('Sabores'),
            ),
    
            InkWell(
              borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              onTap: (crearSolicitudController.producto.value == Productos.nulo || crearSolicitudController.producto.value.sabores == null) ? null : (){},
              child: Container(
                height: 45,
            
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                  color: Colors.grey[700]!.withOpacity(0.7),
                ),
            
                child: SizedBox(
                  height: 45,
                  child: Center(
                    child: Text(
                      'Agregar sabor',
                      style: TextStyle(
                        color: (crearSolicitudController.producto.value == Productos.nulo || crearSolicitudController.producto.value.sabores == null) ? Theme.of(context).textTheme.bodyText1!.color!.withOpacity(0.5) : Theme.of(context).textTheme.bodyText1!.color
                      ),
                    )
                  )
                ),
            
              ),
            ),
    
            Container(
              // height: 250,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30)),
                color: Colors.grey[900],
              ),
    
              child: Column(
                children: (crearSolicitudController.producto.value == Productos.nulo) ? const [ProductoNuloTile()] : (crearSolicitudController.producto.value.sabores == null) ? const [ProductoSinSaborTile()] : (crearSolicitudController.solicitudes.isEmpty) ? const [SinSaboresTile()] : [] ,
              ),
            ),
          ],
        ),
      ),
    );
  }
}