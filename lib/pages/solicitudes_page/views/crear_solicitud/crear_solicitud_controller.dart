import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_producto/selecionar_producto.dart';

class CrearSolicitudController extends GetxController {
  Rx<Producto> producto = Productos.nulo.obs;
  RxList<Solicitud> solicitudes = RxList.empty();
  Rx<double> descuento = 0.0.obs;

  void onSeleccionarProductoTap() async {
    Producto? tempProducto = await Get.to(() => const SeleccionarProducto());
    if(tempProducto != null){
      producto.value = tempProducto;
      solicitudes = RxList.empty();
      descuento = 0.0.obs;
    }
  }
}