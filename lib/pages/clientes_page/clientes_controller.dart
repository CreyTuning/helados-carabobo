import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';

class ClientesController extends GetxController {
  Map<int, Cliente> clientes = {
    0 : Cliente(nombre: 'Junior Sanchez'),
    1 : Cliente(nombre: 'Eurelia Hoyo'),
    3 : Cliente(nombre: 'Inversiones Montroa 26'),
    4 : Cliente(nombre: 'Yasme Silva'),
    5 : Cliente(nombre: 'Enderson Pérez'),
    6 : Cliente(nombre: 'Inversiones Yesi'),
    7 : Cliente(nombre: 'Ramon Suluaga'),
    8 : Cliente(nombre: 'Ana Fernandez'),
    9 : Cliente(nombre: 'Luis Romero'),
    10 : Cliente(nombre: 'Rafael Escobar'),
    11 : Cliente(nombre: 'Oriana Fernández'),
    12 : Cliente(nombre: 'Maria Sánchez'),
    13 : Cliente(nombre: 'Nidia Gutierrez'),
    14:  Cliente(nombre: 'Coromoto Viloria'),
    15:  Cliente(nombre: 'Ana Santiago'),
    16:  Cliente(nombre: 'Yuliana Torres'),
    17:  Cliente(nombre: 'Hilary Pinto'),

  }.obs;

  void agregarCliente(String nombre){
    clientes[clientes.length + 1] = Cliente(nombre: nombre);
  }
}