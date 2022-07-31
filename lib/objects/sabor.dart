import 'dart:convert';

class Sabor {

  String nombre = '';
  String? categoria = '';
  double? precioCompra = 0.0;
  double? precioVenta = 0.0;


  Sabor({
    required this.nombre,
    this.categoria,
    this.precioCompra,
    this.precioVenta,
  });

  Sabor.parse(String source){
    
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));

    nombre = object['nombre'];
    categoria = object['categoria'];
    precioCompra = object['precioCompra'];
    precioVenta = object['precioVenta'];
  }

  String toJsonEncode(){
    Map<String, dynamic> data = {
      'nombre' : nombre,
      'categoria' : categoria,
      'precioCompra' : precioCompra,
      'precioVenta' : precioVenta
    };

    

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'nombre: $nombre\ncategoria: $categoria\nprecioCompra: $precioCompra\nprecioVenta: $precioVenta';
  }
}