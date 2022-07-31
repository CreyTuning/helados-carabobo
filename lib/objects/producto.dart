import 'dart:convert';

import 'package:mispedidos/objects/sabor.dart';

class Producto{
  Producto({
    required this.id,
    this.paqueteCantidad,
    required this.nombre,
    required this.descripcion,
    this.precioCompra,
    this.precioVenta,
    this.sabores,
  });

  Producto.empty({
    this.id = '',
    this.paqueteCantidad = 0,
    this.nombre = '',
    this.descripcion = '',
    this.precioCompra = 0.0,
    this.precioVenta = 0.0,
    this.sabores = const <Sabor>[]
  });

  late String id;
  late int? paqueteCantidad;
  late String nombre;
  late String descripcion;
  late double? precioCompra;
  late double? precioVenta;
  late List<Sabor>? sabores;

  Producto.parse(String source){

    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));
    List<Sabor> decodedSabores = [];

    // decodificar sabores
    if(object['sabores'] != null){
      for (String source in object['sabores']) {
        decodedSabores.add(Sabor.parse(source));
      }
    }
    
    // agregar valores
    id = object['id'];
    paqueteCantidad = object['paqueteCantidad'];
    nombre = object['nombre'];
    descripcion = object['descripcion'];
    precioCompra = object['precioCompra'];
    precioVenta = object['precioVenta'];
    sabores = (object['sabores'] != null) ? decodedSabores : null;
  }

  String toJsonEncode(){

    List encodedSabores = [];

    // codificar sabores
    if(sabores != null){
      for (Sabor sabor in sabores!) {
        encodedSabores.add(sabor.toJsonEncode());
      } 
    }

    Map<String, dynamic> data = {
      'id' : id,
      'paqueteCantidad' : paqueteCantidad,
      'nombre' : nombre,
      'descripcion' : descripcion,
      'precioCompra' : precioCompra,
      'precioVenta' : precioVenta,
      'sabores' : (sabores != null) ? encodedSabores : null,
    };

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'id: $id\n'
      'paqueteCantidad: $paqueteCantidad\n'
      'nombre: $nombre\n'
      'descripcion: $descripcion\n'
      'precioCompra: $precioCompra\n'
      'precioVenta: $precioVenta\n'
      'sabores: ${sabores!.length}';
  }
}