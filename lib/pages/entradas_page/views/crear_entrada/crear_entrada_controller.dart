import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/sabor.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/entradas_page/views/seleccionar_cantidad.dart';
import 'package:mispedidos/pages/entradas_page/views/seleccionar_producto/selecionar_producto.dart';
import 'package:mispedidos/pages/entradas_page/views/selecionar_sabor.dart';

import '../../../facturas_page/facturas_controller.dart';
import '../../../pedidos_page.dart/pedidos_controller.dart';
import '../../entradas_controller.dart';

class CrearEntradaController extends GetxController {
  Producto producto = Productos.nulo;
  List<Solicitud> solicitudes = [];
  double descuento = 0.0;
  int cantidad = 0;
  bool esNuevoElProducto = false;

  @override
  void onReady() async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController solicitudesController = Get.find();
    
    Producto? argumentProducto  = Get.arguments;
    argumentProducto ??= await Get.to(() => const SeleccionarProducto());

    // Salir por que no se selecciono un producto
    if(argumentProducto == null){
      Get.back();
    }
    
    // Asignar producto seleccionado
    else {
      // El producto ya existe
      if(facturasController.facturas[pedidosController.id.toString()]!.pedidos[solicitudesController.cliente.obs]!.entradas.containsKey(argumentProducto)){
        producto = argumentProducto;
        solicitudes = facturasController.facturas[pedidosController.id.toString()]!.pedidos[solicitudesController.cliente.obs]!.entradas[argumentProducto]!.solicitudes;
        descuento = facturasController.facturas[pedidosController.id.toString()]!.pedidos[solicitudesController.cliente.obs]!.entradas[argumentProducto]!.descuento;
        cantidad = facturasController.facturas[pedidosController.id.toString()]!.pedidos[solicitudesController.cliente.obs]!.entradas[argumentProducto]!.cantidad;
        esNuevoElProducto = false;
      }

      // El producto no existe, inicializar valores
      else {
        producto = argumentProducto;
        solicitudes = RxList();
        descuento = 0.0;
        cantidad = 1;
        esNuevoElProducto = true;

        if(producto.sabores == null){
          await onSeleccionarCantidadTap(producto);
        }

        else {
          await onAgregarSaborTap(producto);
        }
      }
    }

    update();
    super.onReady();
  }

  void onBackTap(){
    if(!esNuevoElProducto){
      onAceptarTap();
    }

    else {
      Get.back();
    }
  }

  void onEditarCantidadTap(int index) async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController entradasController = Get.find();

    int? tempCantidad = await Get.to(() => SeleccionarCantidad(producto: producto, initialValue: solicitudes.elementAt(index).cantidad!,));
    
    if(tempCantidad != null){
      solicitudes.elementAt(index).cantidad = tempCantidad;
    }

    update();
    entradasController.update();
    pedidosController.update();
    facturasController.update();
  }

  void onEditarSaborTap(int index) async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController entradasController = Get.find();
    
    if(obtenerSaboresUsados().length != producto.sabores!.length){

      Sabor? tempSabor = await Get.to(() => SeleccionarSabor(producto: producto, excluir: obtenerSaboresUsados()));
    
      if(tempSabor != null){
        solicitudes.elementAt(index).sabor = tempSabor;
      }
    }

    update();
    entradasController.update();
    pedidosController.update();
    facturasController.update();
  }

  void onBorrarSaborTap(int index) async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController entradasController = Get.find();

    solicitudes.removeAt(index);
    
    update();
    entradasController.update();
    pedidosController.update();
    facturasController.update();
  }

  int obtenerCantidadDeUnidadesSolicitudes(){
    int cantidad = 0;

    solicitudes.forEach((Solicitud solicitud) {
      cantidad += solicitud.cantidad!;
    });

    return cantidad;
  }

  double obtenerValorTotalDeSolicitudes(){
    double valor = 0.0;

    solicitudes.forEach((Solicitud solicitud) {
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

    return valor;
  }

  List<Sabor> obtenerSaboresUsados(){
    
    List<Sabor> saboresUsados = [];

    for (var solicitud in solicitudes) {
      saboresUsados.add(solicitud.sabor!);
    }

    return saboresUsados;
  }

  Future<Producto?> onSeleccionarProductoTap() async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController entradasController = Get.find();
    
    Producto? tempProducto = await Get.to(() => const SeleccionarProducto());
    
    if(facturasController.facturas[pedidosController.id.toString()]!.pedidos[entradasController.cliente.obs]!.entradas.containsKey(tempProducto)){
      producto = facturasController.facturas[pedidosController.id.toString()]!.pedidos[entradasController.cliente.obs]!.entradas[tempProducto]!.producto;
      solicitudes = facturasController.facturas[pedidosController.id.toString()]!.pedidos[entradasController.cliente.obs]!.entradas[tempProducto]!.solicitudes;
      descuento = facturasController.facturas[pedidosController.id.toString()]!.pedidos[entradasController.cliente.obs]!.entradas[tempProducto]!.descuento;
      cantidad = facturasController.facturas[pedidosController.id.toString()]!.pedidos[entradasController.cliente.obs]!.entradas[tempProducto]!.cantidad;
    }

    else if(tempProducto != null){
      producto = tempProducto;
      solicitudes = RxList();
      descuento = 0.0;
      cantidad = 1;
    }

    update();
    entradasController.update();
    pedidosController.update();
    facturasController.update();
    return tempProducto;
  }

  Future<void> onSeleccionarCantidadTap(Producto producto) async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController entradasController = Get.find();
    
    int? cantidad = await Get.to(() => SeleccionarCantidad(producto: producto));

    if(cantidad != null){
      solicitudes = RxList();
      this.cantidad = cantidad;
    }

    update();
    entradasController.update();
    pedidosController.update();
    facturasController.update();
  }

  Future<void> onAgregarSaborTap(Producto producto) async {
    FacturasController facturasController = Get.find();
    PedidosController pedidosController = Get.find();
    EntradasController entradasController = Get.find();

    Sabor? sabor;
    int? cantidad;
    
    sabor = await Get.to(() => SeleccionarSabor(producto: producto, excluir: obtenerSaboresUsados()));

    if(sabor != null){
      int? cantidad = await Get.to(() => SeleccionarCantidad(producto: producto));

      if(cantidad != null){
        solicitudes.insert(0, Solicitud(sabor: sabor, cantidad: cantidad, descuento: 0.0));
      }
    }

    update();
    entradasController.update();
    pedidosController.update();
    facturasController.update();
  }

  void onAceptarTap(){
    Entrada entrada;

    entrada = Entrada(
      producto: producto,
      descuento: descuento,
      cantidad: cantidad,
      solicitudes: solicitudes
    );

    Get.back(result: {producto : entrada});
  }
}