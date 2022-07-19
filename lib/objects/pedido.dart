import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/pago.dart';
import 'package:mispedidos/objects/producto.dart';

class Pedido {
  Pedido({
    required this.cliente,
  });

  final Cliente cliente;
  Rx<DateTime> fecha = DateTime.utc(2022, 1, 1).obs;
  Rx<double> valorDelDolar = 0.0.obs;
  Rx<double> constoEnvio = 0.0.obs;
  Rx<double> descuento = 0.0.obs;
  Rx<double> pagado = 0.0.obs;
  Rx<bool> esEntregado = false.obs;
  Rx<bool> esPagado = false.obs;
  RxList<Pago> pagos = RxList<Pago>();
  RxMap<Producto, Entrada> entradas = <Producto, Entrada>{}.obs;

  double obtenerValor(){
    double valor = 0.0;

    entradas.forEach((producto, entrada) {
      valor += entrada.obtenerValor();
    });

    return valor;
  }

  double obtenerValorDeFabrica(){
    double valor = 0.0;

    entradas.forEach((producto, entrada) {
      valor += entrada.obtenerValorDeFabrica();
    });

    return valor;
  }

  double obtenerGanancia(){
    double valor = 0.0;

    entradas.forEach((producto, entrada) {
      valor += entrada.obtenerGanancia();
    });

    return valor;
  }
}