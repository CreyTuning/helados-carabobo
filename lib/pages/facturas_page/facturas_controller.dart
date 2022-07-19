import 'package:get/get.dart';
import 'package:mispedidos/database/database.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_page.dart';

class FacturasController extends GetxController{

  Rx<int> idCount = 0.obs;
  RxMap<String, Rx<Factura>> facturas = <String, Rx<Factura>>{}.obs;

  @override
  void onInit() {
    Database.init();
    super.onInit();
  }

  void onFacturaTileTap(int id) {
    Get.to(() => const PedidosPage(), arguments: id);
  }

  void onNewFacturaTap(){
    facturas['${idCount.value}'] = Factura(id: idCount.value).obs;
    idCount.value++;
  }

  void onDismissedFactura(int index){
    facturas.remove('$index');
  }

  void forceUpdate(){
    Get.forceAppUpdate();
  }
}