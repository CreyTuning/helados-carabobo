import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';

import '../pedidos_page.dart/pedidos_controller.dart';
import 'views/crear_entrada/crear_entrada.dart';

class EntradasController extends GetxController{
  late Cliente cliente;
  
  @override
  void onInit() {
    cliente = Get.arguments;
    super.onInit();
  }

  void onAgregarTap(Producto? producto) async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    
    Map<Producto, Entrada>? mapEntrada = await Get.to(()=> const CrearEntrada(), arguments: producto);

    if(mapEntrada != null){
      facturasController.facturas[pedidosController.id.toString()]!.pedidos[cliente.obs]!.entradas.addAll(mapEntrada);
    }

    update();
    pedidosController.update();
    facturasController.update();
  }

  void onRemoveEntrada(Producto key){
    Get.defaultDialog(
      radius: 10,
      title: 'Eliminar entrada',
      middleText: 'Estas eliminando una entrada ¿Deseas continuar?',
      actions: [

        OutlinedButton(
          child: const Text('Cancelar', style: TextStyle(color: Colors.white,)),
          onPressed: (){
            Get.back();
          }
        ),

        ElevatedButton(
          onPressed: (){
            PedidosController pedidosController = Get.find();
            FacturasController facturasController = Get.find();
            
            facturasController.facturas['${pedidosController.id}']!.pedidos[cliente]!.entradas.remove(key);
            update();
            Get.back();
          },
          child: const Text('Eliminar')
        ),
        
      ]
    );
  }

  double valorTotalDeLaEntrada(Producto producto, Entrada entrada){
    double valor = 0.0;

    // Si el producto tiene sabores
    if(producto.sabores != null){
      entrada.solicitudes.forEach((Solicitud solicitud) {
        if(producto.paqueteCantidad == null){
          if(solicitud.sabor!.precioVenta == null){
            valor += producto.precioVenta! * solicitud.cantidad!;
          }

          else if(solicitud.sabor!.precioVenta != null){
            valor += solicitud.sabor!.precioVenta! * solicitud.cantidad!;
          }
        }
        
        else if(producto.paqueteCantidad != null) {
        if(solicitud.sabor!.precioVenta == null){
            valor += producto.precioVenta! * solicitud.cantidad! * producto.paqueteCantidad!;
          }

          else if(solicitud.sabor!.precioVenta != null){
            valor += solicitud.sabor!.precioVenta! * solicitud.cantidad! * producto.paqueteCantidad!;
          }
        }
      });
    }
    
    // Si el producto NO tiene sabores
    else {
      if(producto.paqueteCantidad == null){
        valor = producto.precioVenta! * entrada.cantidad;
      }

      else {
        valor = producto.precioVenta! * entrada.cantidad * producto.paqueteCantidad!;
      }
    }

    return valor;
  }

  int obtenerCantidadDeUnidadesEntrada(Producto producto, Entrada entrada){
    int cantidad = 0;
    
    if(producto.sabores != null){
      entrada.solicitudes.forEach((Solicitud solicitud) {
        cantidad += solicitud.cantidad!;
      });
    }

    else {
      cantidad = entrada.cantidad;
    }
    

    return cantidad;
  }
}