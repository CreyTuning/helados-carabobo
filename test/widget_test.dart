import 'package:get_storage/get_storage.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/objects/entrada.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/objects/pago.dart';
import 'package:mispedidos/objects/pedido.dart';
import 'package:mispedidos/objects/sabor.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'dart:convert';

void main() async {

  await GetStorage.init();
  GetStorage database = GetStorage();
  late Factura decoded;
  
  Pedido pedido = Pedido.test(
    cliente: Cliente(nombre: 'jose perez'),

    pagos: [
      Pago(monto: 25.4, descripcion: 'descripcion', metodoDePago: 'divisa'),
      Pago(monto: 41.54, descripcion: 'algo mas', metodoDePago: 'pagomovil'),
      Pago(monto: 25.4, descripcion: 'descripcion', metodoDePago: 'divisa'),
      Pago(monto: 25.4, descripcion: 'descripcion', metodoDePago: 'divisa'),
      Pago(monto: 25.4, descripcion: 'descripcion', metodoDePago: 'divisa'),
    ],

    entradas: {
      Productos.barquilla : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
      Productos.tiniton : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
      Productos.swing : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
      Productos.sorbete : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
      Productos.sundae : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
      Productos.medioLitro : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
      Productos.cucharilla : Entrada(producto: Productos.barquilla, descuento: 0, cantidad: 12, solicitudes: [Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25), Solicitud(sabor: Sabor(nombre: 'choco'), cantidad: 25)]),
    }
  );

  Factura factura = Factura.test(
    id: 1,
    fecha: DateTime.now(),
    estado: 0,
    numero: 125,
    valorDelDolar: 5.89,
    pedidos: {
      Cliente(nombre: '1jose') : pedido,
      Cliente(nombre: '2joggse') : pedido,
      Cliente(nombre: '3jossse') : pedido,
      Cliente(nombre: '4josaere') : pedido,
      Cliente(nombre: '5jo234se') : pedido,
      Cliente(nombre: '6joggse') : pedido,
      Cliente(nombre: '7josdfgse') : pedido,
      Cliente(nombre: '8jocvse') : pedido,
      Cliente(nombre: '9jo14se') : pedido,
      Cliente(nombre: '0jo355se') : pedido,
    },
  );
  
  database.write('value', factura.toJsonEncode());
  decoded = Factura.parse(database.read('value'));

  print(decoded.toString());
}
