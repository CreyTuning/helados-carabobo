import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pedido.dart';
import 'package:objectbox/objectbox.dart';

class Factura {
  Factura({
    required this.id,
  });

  final int id;
  Rx<DateTime> fecha = DateTime.now().obs;
  Rx<double> valorDelDolar = 0.0.obs;
  Rx<int> estado = 0.obs;
  Rx<int> numero = 0.obs;
  RxMap<Rx<Cliente>, Rx<Pedido>> pedidos = <Rx<Cliente>, Rx<Pedido>>{}.obs;

  double obtenerValor(){
    double valor = 0.0;

    pedidos.forEach((cliente, pedido) {
      valor += pedido.value.obtenerValor();
    });

    return valor;
  }

  double obtenerValorDeFabrica(){
    double valor = 0.0;

    pedidos.forEach((cliente, pedido) {
      valor += pedido.value.obtenerValorDeFabrica();
    });

    return valor;
  }

  double obtenerGanancia(){
    double valor = 0.0;

    pedidos.forEach((cliente, pedido) {
      valor += pedido.value.obtenerGanancia();
    });

    return valor;
  }
}