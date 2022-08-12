import 'dart:convert';

import 'package:mispedidos/objects/overviewItem.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';

class Entrada {

  Entrada({
    required this.producto,
    required this.descuento,
    required this.cantidad,
    required this.solicitudes
  });

  late Producto producto;
  late List<Solicitud> solicitudes;
  int cantidad = 0;
  double descuento = 0.0;


  Entrada.parse(String source){
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));
    List<Solicitud> decodedSolicitudes = [];

    // decodificar solicitudes
    for (String source in object['solicitudes']) {
      decodedSolicitudes.add(Solicitud.parse(source));
    }

    // agregar valores
    producto = Producto.parse(object['producto']);
    solicitudes = decodedSolicitudes;
    cantidad = object['cantidad'];
    descuento = object['descuento'];
  }

  List<OverviewItem> toOverviewItemList(){
    List<OverviewItem> items = [];
    
    // Sin sabores
    if(solicitudes.isEmpty){
      items.add(OverviewItem(
        producto: producto.nombre,
        sabor: '',
        cantidad: cantidad,
        blister: producto.paqueteCantidad != null ? true : false
      ));
    }

    // Con sabores
    else if(solicitudes.isNotEmpty){
      for (Solicitud solicitud in solicitudes) {
        items.add(OverviewItem(
          producto: producto.nombre,
          sabor: solicitud.sabor!.nombre,
          cantidad: solicitud.cantidad!,
          blister: producto.paqueteCantidad != null ? true : false
        ));
      }}

    return items;
  }

  String toJsonEncode(){

    List encodedSolicitudes = [];

    // codificar solicitudes
    for (Solicitud solicitud in solicitudes) {
      encodedSolicitudes.add(solicitud.toJsonEncode());
    }

    Map<String, dynamic> data = {
      'producto' : producto.toJsonEncode(),
      'solicitudes' : encodedSolicitudes,
      'cantidad' : cantidad,
      'descuento' : descuento,
    };

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'producto: ${producto.nombre}\n'
      'solicitudes: ${solicitudes.length}\n'
      'cantidad: $cantidad\n'
      'descuento: $descuento';
  }



  double obtenerValor(){
    double valor = 0.0;

    if(solicitudes.isEmpty){
      valor += (producto.paqueteCantidad == null) ? producto.precioVenta! * cantidad : producto.precioVenta! * cantidad * producto.paqueteCantidad!;
    }


    else {
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
    }

    return valor;
  }


  double obtenerGanancia(){
    double valor = 0.0;

    if(solicitudes.isEmpty){
      valor += (producto.paqueteCantidad == null) ? producto.precioCompra! * cantidad : producto.precioCompra! * cantidad * producto.paqueteCantidad!;
    }

    else {
      solicitudes.forEach((Solicitud solicitud) {

        if(producto.paqueteCantidad == null){
          if(solicitud.sabor!.precioCompra == null){
            valor += producto.precioCompra! * solicitud.cantidad!;
          }

          else if(solicitud.sabor!.precioCompra != null){
            valor += solicitud.sabor!.precioCompra! * solicitud.cantidad!;
          }
        }
        
        else if(producto.paqueteCantidad != null) {
        if(solicitud.sabor!.precioCompra == null){
            valor += producto.precioCompra! * solicitud.cantidad! * producto.paqueteCantidad!;
          }

          else if(solicitud.sabor!.precioCompra != null){
            valor += solicitud.sabor!.precioCompra! * solicitud.cantidad! * producto.paqueteCantidad!;
          }
        }
      });
    }    

    return obtenerValor() - valor;
  }

  double obtenerValorDeFabrica(){
    double valor = 0.0;

    if(solicitudes.isEmpty){
      valor += (producto.paqueteCantidad == null) ? producto.precioCompra! * cantidad : producto.precioCompra! * cantidad * producto.paqueteCantidad!;
    }

    else {
      solicitudes.forEach((Solicitud solicitud) {

        if(producto.paqueteCantidad == null){
          if(solicitud.sabor!.precioCompra == null){
            valor += producto.precioCompra! * solicitud.cantidad!;
          }

          else if(solicitud.sabor!.precioCompra != null){
            valor += solicitud.sabor!.precioCompra! * solicitud.cantidad!;
          }
        }
        
        else if(producto.paqueteCantidad != null) {
        if(solicitud.sabor!.precioCompra == null){
            valor += producto.precioCompra! * solicitud.cantidad! * producto.paqueteCantidad!;
          }

          else if(solicitud.sabor!.precioCompra != null){
            valor += solicitud.sabor!.precioCompra! * solicitud.cantidad! * producto.paqueteCantidad!;
          }
        }
      });
    }    

    return valor;
  }  
}