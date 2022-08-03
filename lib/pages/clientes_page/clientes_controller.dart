import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';

class ClientesController extends GetxController {
  Map<int, Cliente> clientes = {
    0 : Cliente(nombre: 'Junior Sanchez'),
    1 : Cliente(nombre: 'Eurelia Hoyo'),
    3 : Cliente(nombre: 'Inversiones Montroa 26'),
    4 : Cliente(nombre: 'Yasme Silva'),
    5 : Cliente(nombre: 'David Perez'),
    6 : Cliente(nombre: 'Inversiones Yesi'),
    7 : Cliente(nombre: 'Ramon Suluaga'),
    8 : Cliente(nombre: 'Inversiones Los Guayos del 2021'),
    9 : Cliente(nombre: 'Ana Fernandez'),
  }.obs;

  void agregarCliente(String nombre){
    clientes[clientes.length + 1] = Cliente(nombre: nombre);
  }
}