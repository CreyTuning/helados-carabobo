import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pago.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';

class Pedido {
  Pedido({
    required this.cliente,
  });

  final Cliente cliente;
  Rx<DateTime> fecha = DateTime.utc(2022, 1, 1).obs;
  Rx<double> valorDelDolar = 0.0.obs;
  Rx<double> constoEnvio = 0.0.obs;
  Rx<double> descuento = 0.0.obs;
  Rx<double> ganancia = 0.0.obs;
  Rx<double> adeudado = 0.0.obs;
  Rx<double> pagado = 0.0.obs;
  Rx<bool> esEntregado = false.obs;
  Rx<bool> esPagado = false.obs;
  RxList<Pago> pagos = RxList<Pago>();
  RxMap<Producto, List<Solicitud>> solicitudes = <Producto, List<Solicitud>>{}.obs;
}