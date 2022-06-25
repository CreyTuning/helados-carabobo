import 'package:mispedidos/objects/sabor.dart';

class Solicitud {

  Solicitud({
    required this.sabor,
    required this.cantidad,
    this.descuento
  });

  Solicitud.empty();

  Sabor? sabor;
  int? cantidad;
  double? descuento;
}