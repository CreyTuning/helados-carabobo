import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';

class Entrada {

  Entrada({
    required this.producto,
    required this.descuento,
    required this.cantidad,
    required this.solicitudes
  });

  Rx<Producto> producto;
  RxList<Solicitud> solicitudes;
  RxInt cantidad = 0.obs;
  RxDouble descuento = 0.0.obs;


  double obtenerValor(){
    double valor = 0.0;

    if(solicitudes.isEmpty){
      valor += (producto.value.paqueteCantidad == null) ? producto.value.precioVenta! * cantidad.value : producto.value.precioVenta! * cantidad.value * producto.value.paqueteCantidad!;
    }


    else {
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
    }

    

    return valor;
  }


  double obtenerGanancia(){
    double valor = 0.0;

    if(solicitudes.isEmpty){
      valor += (producto.value.paqueteCantidad == null) ? producto.value.precioCompra! * cantidad.value : producto.value.precioCompra! * cantidad.value * producto.value.paqueteCantidad!;
    }

    else {
      solicitudes.forEach((Solicitud solicitud) {

        if(producto.value.paqueteCantidad == null){
          if(solicitud.sabor.value!.precioCompra == null){
            valor += producto.value.precioCompra! * solicitud.cantidad.value!;
          }

          else if(solicitud.sabor.value!.precioCompra != null){
            valor += solicitud.sabor.value!.precioCompra! * solicitud.cantidad.value!;
          }
        }
        
        else if(producto.value.paqueteCantidad != null) {
        if(solicitud.sabor.value!.precioCompra == null){
            valor += producto.value.precioCompra! * solicitud.cantidad.value! * producto.value.paqueteCantidad!;
          }

          else if(solicitud.sabor.value!.precioCompra != null){
            valor += solicitud.sabor.value!.precioCompra! * solicitud.cantidad.value! * producto.value.paqueteCantidad!;
          }
        }
      });
    }    

    return obtenerValor() - valor;
  }

  double obtenerValorDeFabrica(){
    double valor = 0.0;

    if(solicitudes.isEmpty){
      valor += (producto.value.paqueteCantidad == null) ? producto.value.precioCompra! * cantidad.value : producto.value.precioCompra! * cantidad.value * producto.value.paqueteCantidad!;
    }

    else {
      solicitudes.forEach((Solicitud solicitud) {

        if(producto.value.paqueteCantidad == null){
          if(solicitud.sabor.value!.precioCompra == null){
            valor += producto.value.precioCompra! * solicitud.cantidad.value!;
          }

          else if(solicitud.sabor.value!.precioCompra != null){
            valor += solicitud.sabor.value!.precioCompra! * solicitud.cantidad.value!;
          }
        }
        
        else if(producto.value.paqueteCantidad != null) {
        if(solicitud.sabor.value!.precioCompra == null){
            valor += producto.value.precioCompra! * solicitud.cantidad.value! * producto.value.paqueteCantidad!;
          }

          else if(solicitud.sabor.value!.precioCompra != null){
            valor += solicitud.sabor.value!.precioCompra! * solicitud.cantidad.value! * producto.value.paqueteCantidad!;
          }
        }
      });
    }    

    return valor;
  }
}