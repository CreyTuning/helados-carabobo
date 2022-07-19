import 'package:get_storage/get_storage.dart';
import 'package:mispedidos/objects/factura.dart';

class Database {
  static init() async {
    await GetStorage.init();
    GetStorage database = GetStorage();

    await database.write('1', Factura(id: 1));

    database.read('1');
  }
}