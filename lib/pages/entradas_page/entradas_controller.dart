import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/entradas_page/views/crear_entrada/crear_entrada_controller.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';

import '../pedidos_page.dart/pedidos_controller.dart';
import 'views/crear_entrada/crear_entrada.dart';

class EntradasController extends GetxController{
  Cliente cliente = Cliente(nombre: '');
  
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
      facturasController.facturas[pedidosController.id.toString()]!.value.pedidos[cliente.obs]!.value.entradas.addAll(mapEntrada);
    }
  }

  double valorTotalDeLaEntrada(Producto producto, Entrada entrada){
    double valor = 0.0;

    // Si el producto tiene sabores
    if(producto.sabores != null){
      entrada.solicitudes.forEach((Solicitud solicitud) {
        if(producto.paqueteCantidad == null){
          if(solicitud.sabor.value!.precioVenta == null){
            valor += producto.precioVenta! * solicitud.cantidad.value!;
          }

          else if(solicitud.sabor.value!.precioVenta != null){
            valor += solicitud.sabor.value!.precioVenta! * solicitud.cantidad.value!;
          }
        }
        
        else if(producto.paqueteCantidad != null) {
        if(solicitud.sabor.value!.precioVenta == null){
            valor += producto.precioVenta! * solicitud.cantidad.value! * producto.paqueteCantidad!;
          }

          else if(solicitud.sabor.value!.precioVenta != null){
            valor += solicitud.sabor.value!.precioVenta! * solicitud.cantidad.value! * producto.paqueteCantidad!;
          }
        }
      });
    }
    
    // Si el producto NO tiene sabores
    else {
      if(producto.paqueteCantidad == null){
        valor = producto.precioVenta! * entrada.cantidad.value;
      }

      else {
        valor = producto.precioVenta! * entrada.cantidad.value * producto.paqueteCantidad!;
      }
    }

    return valor;
  }

  int obtenerCantidadDeUnidadesEntrada(Producto producto, Entrada entrada){
    int cantidad = 0;
    
    if(producto.sabores != null){
      entrada.solicitudes.forEach((Solicitud solicitud) {
        cantidad += solicitud.cantidad.value!;
      });
    }

    else {
      cantidad = entrada.cantidad.value;
    }
    

    return cantidad;
  }
}