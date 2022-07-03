import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';

import '../data/productos.dart';

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
}