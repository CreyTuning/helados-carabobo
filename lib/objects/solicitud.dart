import 'dart:convert';

import 'package:mispedidos/objects/sabor.dart';

class Solicitud {

  Solicitud({
    required this.sabor,
    required this.cantidad,
    this.descuento
  });

  Sabor? sabor;
  int? cantidad;
  double? descuento;
  

  Solicitud.parse(String source){
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));

    sabor = Sabor.parse(object['sabor']);
    cantidad = object['cantidad'];
    descuento = object['descuento'];
  }

  String toJsonEncode(){
    Map<String, dynamic> data = {
      'sabor' : sabor!.toJsonEncode(),
      'cantidad' : cantidad,
      'descuento' : descuento,
    };
    
    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'sabor: ${sabor!.nombre}\ncantidad: $cantidad\ndescuento: $descuento';
  }
}