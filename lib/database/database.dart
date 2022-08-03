import 'package:get_storage/get_storage.dart';
import 'package:lzstring/lzstring.dart';
import 'package:mispedidos/objects/factura.dart';

class Database {

  static late GetStorage dbFacturas;
  static late GetStorage dbValues;

  static init() async {
    await GetStorage.init();
    dbFacturas = GetStorage();
    dbValues = GetStorage();
  }



  static Future<int> loadIdCount() async {
    int idCount = 0;
    
    if(dbFacturas.hasData('idCount')){
      idCount = await dbFacturas.read('idCount');
    }

    return idCount;
  }

  static saveIdCount(int idCount){
    dbValues.write('idCount', idCount);
  }



  static Future<Map<String, Factura>?> loadFacturas({required int month, required int year}) async {

    if(dbFacturas.hasData('$year-$month')){
      List encoded = await dbFacturas.read('$year-$month');
      Map<String, Factura> decoded = {};

      for(String source in encoded) {
        decoded[Factura.parse(LZString.decompressSync(source) as String).id.toString()] = Factura.parse(LZString.decompressSync(source) as String);
      }

      return decoded;
    }

    return null;
  }


  static saveFacturas({required Map<String, Factura> facturas, required int month, required int year}) async {
    List<String> encoded = [];

    for(Factura factura in facturas.values) {
      encoded.add(LZString.compressSync(factura.toJsonEncode()) as String);
    }

    await dbFacturas.write('$year-$month', encoded);
  }
}