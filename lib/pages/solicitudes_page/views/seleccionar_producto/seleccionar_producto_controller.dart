import 'package:get/get.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/objects/solicitud.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_cantidad.dart';
import 'package:mispedidos/pages/solicitudes_page/views/selecionar_sabor.dart';

class SeleccionarProductoController extends GetxController {
  Rx<int> categotyIndex = 0.obs;

  void setCategoryIndex(int index){
    categotyIndex.value = index;
  }

  void onProductoTap(Producto producto){
    Get.back(result: producto);
    // String? sabor;
    // int cantidad = 0;

    // // Obtener sabor
    // if(producto.sabores != null){
    //   sabor = await Get.to(() => SeleccionarSabor(producto: producto), preventDuplicates: true); 
    // }

    // // Obtener sabor
    // Get.to(SeleccionarCantidad(producto: producto, sabor: null), preventDuplicates: true);
  }
}