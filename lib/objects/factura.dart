import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pedido.dart';

class Factura {

  Factura({
    required this.id,
  });

  final int id;
  Rx<DateTime> fecha = DateTime.now().obs;
  Rx<double> valorDelDolar = 0.0.obs;
  Rx<double> adeudado = 0.0.obs;
  Rx<double> ganancia = 0.0.obs;
  Rx<int> estado = 0.obs;
  Rx<int> numero = 0.obs;
  RxMap<Cliente, Pedido> pedidos = <Cliente, Pedido>{}.obs;
}