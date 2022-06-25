import 'package:get/get.dart';

enum MetodoDePago {divisa, efectivo, pagomovil}

class Pago {
  Pago({
    required this.monto,
    required this.descripcion,
    required this.metodoDePago
  });

  Rx<double> monto;
  Rx<String> descripcion;
  Rx<MetodoDePago> metodoDePago;
}