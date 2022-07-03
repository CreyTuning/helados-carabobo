import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_cantidad.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_producto/selecionar_producto.dart';
import 'package:mispedidos/pages/solicitudes_page/views/selecionar_sabor.dart';

import '../../../facturas_page/facturas_controller.dart';
import '../../../pedidos_page.dart/pedidos_controller.dart';
import '../../entradas_controller.dart';

class CrearSolicitudController extends GetxController {
  Rx<Producto> producto = Productos.nulo.obs;
  RxList<Solicitud> solicitudes = RxList();
  RxDouble descuento = 0.0.obs;
  RxInt cantidad = 0.obs;

  @override
  void onReady() async {
    if(producto.value == Productos.nulo){
      if(await onSeleccionarProductoTap() == null){
        Get.back();
      }
    }
    super.onReady();
  }

  void onEditarCantidadTap(int index) async {
    int? tempCantidad = await Get.to(() => SeleccionarCantidad(producto: producto.value, initialValue: solicitudes.elementAt(index).cantidad.value!,));
    
    if(tempCantidad != null){
      solicitudes.elementAt(index).cantidad.value = tempCantidad;
    }
  }

  void onEditarSaborTap(int index) async {
    
    if(obtenerSaboresUsados().length != producto.value.sabores!.length){

      Sabor? tempSabor = await Get.to(() => SeleccionarSabor(producto: producto.value, excluir: obtenerSaboresUsados()));
    
      if(tempSabor != null){
        solicitudes.elementAt(index).sabor.value = tempSabor;
      }
    }
  }

  void onBorrarSaborTap(int index) async {
    solicitudes.removeAt(index);
  }

  int obtenerCantidadDeUnidadesSolicitudes(){
    int cantidad = 0;

    solicitudes.forEach((Solicitud solicitud) {
      cantidad += solicitud.cantidad.value!;
    });

    return cantidad;
  }

  double obtenerValorTotalDeSolicitudes(){
    double valor = 0.0;

    solicitudes.forEach((Solicitud solicitud) {
      if(producto.value.paqueteCantidad == null){
        if(solicitud.sabor.value!.precioVenta == null){
          valor += producto.value.precioVenta! * solicitud.cantidad.value!;
        }

        else if(solicitud.sabor.value!.precioVenta != null){
          valor += solicitud.sabor.value!.precioVenta! * solicitud.cantidad.value!;
        }
      }
      
      else if(producto.value.paqueteCantidad != null) {
       if(solicitud.sabor.value!.precioVenta == null){
          valor += producto.value.precioVenta! * solicitud.cantidad.value! * producto.value.paqueteCantidad!;
        }

        else if(solicitud.sabor.value!.precioVenta != null){
          valor += solicitud.sabor.value!.precioVenta! * solicitud.cantidad.value! * producto.value.paqueteCantidad!;
        }
      }
    });

    return valor;
  }

  List<Sabor> obtenerSaboresUsados(){
    
    List<Sabor> saboresUsados = [];

    for (var solicitud in solicitudes) {
      saboresUsados.add(solicitud.sabor.value!);
    }

    return saboresUsados;
  }

  Future<Producto?> onSeleccionarProductoTap() async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController solicitudesController = Get.find();
    
    Producto? tempProducto = await Get.to(() => const SeleccionarProducto());
    
    if(facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[solicitudesController.cliente]!.entradas.containsKey(tempProducto)){
      producto.value = facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[solicitudesController.cliente]!.entradas[tempProducto]!.producto.value;
      solicitudes.value = facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[solicitudesController.cliente]!.entradas[tempProducto]!.solicitudes;
      descuento.value = facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[solicitudesController.cliente]!.entradas[tempProducto]!.descuento.value;
      cantidad.value = facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[solicitudesController.cliente]!.entradas[tempProducto]!.cantidad.value;
    }

    else if(tempProducto != null){
      producto.value = tempProducto;
      solicitudes = RxList();
      descuento = 0.0.obs;
      cantidad.value = 1;
    }
    
    return tempProducto;
  }

  void onSeleccionarCantidadTap(BuildContext buildContext, Producto producto) async {
    int? cantidad = await Get.to(() => SeleccionarCantidad(producto: producto));

    if(cantidad != null){
      solicitudes = RxList();
      this.cantidad.value = cantidad;
    }
  }

  void onAgregarSaborTap(BuildContext buildContext, Producto producto) async {
    Sabor? sabor;
    int? cantidad;
    
    sabor = await Get.to(() => SeleccionarSabor(producto: producto, excluir: obtenerSaboresUsados()));

    if(sabor != null){
      int? cantidad = await Get.to(() => SeleccionarCantidad(producto: producto));

      if(cantidad != null){
        solicitudes.insert(0, Solicitud(sabor: sabor.obs, cantidad: cantidad.obs, descuento: 0.0.obs));
      }
    }

  }

  void onAceptarTap(){
    Entrada entrada;

    entrada = Entrada(
      producto: producto,
      descuento: descuento,
      cantidad: cantidad,
      solicitudes: solicitudes
    );

    Get.back(result: {producto.value : entrada});
  }
}