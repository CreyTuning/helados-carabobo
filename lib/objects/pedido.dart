import 'dart:convert';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/pago.dart';
import 'package:mispedidos/objects/producto.dart';

class Pedido {
  Pedido({
    required this.cliente,
  });

  Pedido.test({
    required this.cliente,
    required this.pagos,
    required this.entradas
  });

  Cliente cliente = Cliente(nombre: '');
  DateTime fecha = DateTime.utc(2022, 1, 1);
  double valorDelDolar = 0.0;
  double constoEnvio = 0.0;
  double descuento = 0.0;
  double pagado = 0.0;
  bool esEntregado = false;
  bool esPagado = false;
  List<Pago> pagos = <Pago>[];
  Map<Producto, Entrada> entradas = {};


  Pedido.parse(String source){
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));
    List<Pago> decodedPagos = [];
    Map<Producto, Entrada> decodedEntradas = {};

    // decodificar pagos
    for (String source in object['pagos']) {
      decodedPagos.add(Pago.parse(source));
    }

    // decodificar entradas
    object['entradas'].forEach((producto, entrada) {
      decodedEntradas[Producto.parse(producto)] = Entrada.parse(entrada);
    });

    // agregar valores
    cliente = Cliente.parse(object['cliente']);
    fecha = DateTime.parse(object['fecha']);
    valorDelDolar = object['valorDelDolar'];
    constoEnvio = object['constoEnvio'];
    descuento = object['descuento'];
    pagado = object['pagado'];
    esEntregado = object['esEntregado'];
    esPagado = object['esPagado'];
    pagos = decodedPagos;
    entradas = decodedEntradas;
  }

  String toJsonEncode(){

    List encodedPagos = [];
    Map<String, String> encodedEntradas = {};

    // codificar pagos
    for (Pago pago in pagos) {
      encodedPagos.add(pago.toJsonEncode());
    }

    // codificar entradas
    entradas.forEach((producto, entrada) {
      // encodedEntradas.assign(producto.toJsonEncode(), entrada.toJsonEncode());
      encodedEntradas[producto.toJsonEncode()] = entrada.toJsonEncode();
    });

    // crear data
    Map<String, dynamic> data = {
      'cliente' : cliente.toJsonEncode(),
      'fecha' : fecha.toString(),
      'valorDelDolar' : valorDelDolar,
      'constoEnvio' : constoEnvio,
      'descuento' : descuento,
      'pagado' : pagado,
      'esEntregado' : esEntregado,
      'esPagado' : esPagado,
      'pagos' : encodedPagos,
      'entradas' : encodedEntradas,
    };

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'cliente: ${cliente.nombre}\n'
      'fecha: $fecha\n'
      'valorDelDolar: $valorDelDolar\n'
      'constoEnvio: $constoEnvio\n'
      'descuento: $descuento\n'
      'pagado: $pagado\n'
      'esEntregado: $esEntregado\n'
      'esPagado: $esPagado\n'
      'pagos: ${pagos.length}\n'
      'entradas: ${entradas.length}';
  }



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