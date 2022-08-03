import 'package:get/get.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/objects/solicitud.dart';

class OverviewFacturaController extends GetxController {
  Factura factura = Factura(id: -1);
  List<Solicitud> solicitudes = [];

  @override
  void onInit() {
    factura = Get.arguments;
    super.onInit();
  }

  void generarSolicitudesGenerales(){
    factura.pedidos.forEach((key, value) {
      
    });
  }
}