import 'package:get/get.dart';
import 'package:mispedidos/objects/producto.dart';

class SeleccionarProductoController extends GetxController {
  Rx<int> categotyIndex = 0.obs;

  void setCategoryIndex(int index){
    categotyIndex.value = index;
  }

  void onProductoTap(Producto producto){
    Get.back(result: producto);
  }
}