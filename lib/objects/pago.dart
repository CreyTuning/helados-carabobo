import 'dart:convert';

class Pago {
  Pago({
    required this.monto,
    required this.descripcion,
    required this.metodoDePago
  });

  late double monto;
  late String descripcion;
  late String metodoDePago;


  Pago.parse(String source){
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));

    monto = object['monto'];
    descripcion = object['descripcion'];
    metodoDePago = object['metodoDePago'];
  }

  String toJsonEncode(){
    Map<String, dynamic> data = {
      'monto' : monto,
      'descripcion' : descripcion,
      'metodoDePago' : metodoDePago
    };

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'monto: $monto\n'
      'descripcion: $descripcion\n'
      'metodoDePago: $metodoDePago\n';
  }
}