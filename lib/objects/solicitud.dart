import 'package:get/get.dart';
import 'package:mispedidos/objects/sabor.dart';

class Solicitud {

  Solicitud({
    required this.sabor,
    required this.cantidad,
    this.descuento
  });

  // Solicitud.empty();

  Rx<Sabor?> sabor;
  Rx<int?> cantidad;
  Rx<double?>? descuento;
}