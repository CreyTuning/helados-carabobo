import 'package:flutter/material.dart';

class Sabor {

  Sabor({
    required this.nombre,
    this.categoria,
    this.precioCompra,
    this.precioVenta,
  });

  final String nombre;
  final String? categoria;
  final double? precioCompra;
  final double? precioVenta;
}