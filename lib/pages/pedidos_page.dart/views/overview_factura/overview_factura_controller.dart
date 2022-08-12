import 'package:get/get.dart';
import 'package:mispedidos/objects/factura.dart';
import 'package:mispedidos/objects/overviewItem.dart';

class OverviewFacturaController extends GetxController {
  Factura factura = Factura(id: -1);
  List<OverviewItem> overviewItems = [];

  @override
  void onInit() {
    factura = Get.arguments;
    super.onInit();
  }

 Future<List<OverviewItem>> getOverviewItems() async {

    List<OverviewItem> allOverviewItemList = [];
    List<OverviewItem> tempList = [];
    List<OverviewItem> marge = [];
    

    // Crear lista general de Overview Items
    factura.pedidos.forEach((cliente, pedido){
      pedido.entradas.forEach((producto, entrada){
        entrada.toOverviewItemList().forEach((overviewItem){
          allOverviewItemList.add(overviewItem);
        });
      });
    });


    while (allOverviewItemList.isNotEmpty) {
      List<int> indexToDelete = [];
      OverviewItem overviewItem = allOverviewItemList.first;

      for (var i = 0; i < allOverviewItemList.length; i++) {
        // usar primer valor como refencia
        if(i == 0) {
          indexToDelete.add(i);
        }
        
        // comparar y sumar Items
        else {
          if(
            overviewItem.producto == allOverviewItemList[i].producto &&
            overviewItem.sabor == allOverviewItemList[i].sabor &&
            overviewItem.blister == allOverviewItemList[i].blister
          ){
            overviewItem.cantidad += allOverviewItemList[i].cantidad;
            indexToDelete.add(i);
          }
        }
      }

      // remover los items que se sumaron
      tempList = allOverviewItemList;
      allOverviewItemList = [];

      for (int i = 0; i < tempList.length; i++) {
        if(!indexToDelete.contains(i)){
          allOverviewItemList.add(tempList[i]);
        }
      }

      // limpiar variables
      indexToDelete = [];
      tempList = [];

      // agregar item a la lista
      marge.add(overviewItem);
    }

    return marge;
  }
}