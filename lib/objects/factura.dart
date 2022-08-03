import 'dart:convert';

import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/pedido.dart';

class Factura {
  Factura({
    required this.id,
  });

  Factura.test({
    required this.id,
    required this.fecha,
    required this.estado,
    required this.numero,
    required this.pedidos,
    required this.valorDelDolar,
  });


  int id = 0;
  DateTime fecha = DateTime.now();
  double valorDelDolar = 0;
  int estado = 0;
  int numero = 0;
  Map<Cliente, Pedido> pedidos = {};

  Factura.parse(String source){
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));
    Map<Cliente, Pedido> decodedPedidos = {};

    // decodificar pedidos
    object['pedidos'].forEach((cliente, pedido) {
      decodedPedidos[Cliente.parse(cliente)] = Pedido.parse(pedido);
    });

    // agregar valores
    id = object['id'];
    fecha = DateTime.parse(object['fecha']);
    valorDelDolar = object['valorDelDolar'];
    estado = object['estado'];
    numero = object['numero'];
    pedidos = decodedPedidos;
  }

  String toJsonEncode(){
    Map<String, String> encodedPedidos = {};

    // codificar pedidos
    pedidos.forEach((cliente, pedido) {
      encodedPedidos[cliente.toJsonEncode()] = pedido.toJsonEncode();
    });

    // crear data
    Map<String, dynamic> data = {
      'id' : id,
      'fecha' : fecha.toString(),
      'valorDelDolar' : valorDelDolar,
      'estado' : estado,
      'numero' : numero,
      'pedidos' : encodedPedidos,
    };

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'id: $id\n'
      'fecha: $fecha\n'
      'valorDelDolar: $valorDelDolar\n'
      'estado: $estado\n'
      'numero: $numero\n'
      'pedidos: ${pedidos.length}';
  }

  double obtenerValor(){
    double valor = 0.0;

    pedidos.forEach((cliente, pedido) {
      valor += pedido.obtenerValor();
    });

    return valor;
  }

  double obtenerValorDeFabrica(){
    double valor = 0.0;

    pedidos.forEach((cliente, pedido) {
      valor += pedido.obtenerValorDeFabrica();
    });

    return valor;
  }

  double obtenerGanancia(){
    double valor = 0.0;

    pedidos.forEach((cliente, pedido) {
      valor += pedido.obtenerGanancia();
    });

    return valor;
  }
}