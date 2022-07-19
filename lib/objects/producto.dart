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

  final String id;
  final int? paqueteCantidad;
  final String nombre;
  final String descripcion;
  final double? precioCompra;
  final double? precioVenta;
  final List<Sabor>? sabores;
}