import 'dart:convert';

class Cliente {
  Cliente({
    required this.nombre,
  });

  String nombre = '';
  String direccion = '';

  Cliente.parse(String source){
    Map<String, dynamic> object = jsonDecode(utf8.decode(base64.decode(source)));

    nombre = object['nombre'];
    direccion = object['direccion'];
  }

  String toJsonEncode(){
    Map<String, dynamic> data = {
      'nombre' : nombre,
      'direccion' : direccion,
    };

    return base64.encode(utf8.encode(jsonEncode(data)));
  }

  @override
  String toString() {
    return 'nombre: $nombre\n'
      'direccion: $direccion\n';
  }
}