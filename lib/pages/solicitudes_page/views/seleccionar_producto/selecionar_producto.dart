import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mispedidos/data/productos.dart';
import 'package:mispedidos/objects/producto.dart';
import 'package:mispedidos/pages/facturas_page/facturas_controller.dart';
import 'package:mispedidos/pages/pedidos_page.dart/pedidos_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/entradas_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_producto/seleccionar_producto_controller.dart';
import 'package:mispedidos/pages/solicitudes_page/widgets/category_button.dart';

class SeleccionarProducto extends StatelessWidget {
  const SeleccionarProducto({Key? key}) : super(key: key);

  List<Producto> getCategoryFromIdex(int index){

    List<Producto> list = <Producto>[];

    if(index == 0) {
      list = Productos.categoriaImpulso;
    } 
    
    else if(index == 1) {
      list = Productos.categoriaPotes;
    }
    
    else if(index == 2) {
      list = Productos.categoriaGalletas;
    }
    
    else if(index == 3) {
      list = Productos.categoriaOtros;
    }

    return list;
  }

  @override
  Widget build(BuildContext context) {

    PedidosController pedidosController = Get.find();
    FacturasController facturasController = Get.find();
    EntradasController solicitudesController = Get.find();
    SeleccionarProductoController seleccionarProductoController = Get.put(SeleccionarProductoController());

    return Obx(
      () => Scaffold(
        appBar: AppBar(
          title: const Text('Seleccionar producto'),
        ),
    
        body: Column(
          children: [
    
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  CategoryButton(
                    label: 'Impulsos',
                    onTap: (){seleccionarProductoController.setCategoryIndex(0);},
                    selected: (seleccionarProductoController.categotyIndex.value == 0) ? true : false,
                  ),
    
                  CategoryButton(
                    label: 'Potes',
                    onTap: (){seleccionarProductoController.setCategoryIndex(1);},
                    selected: (seleccionarProductoController.categotyIndex.value == 1) ? true : false,
                  ),
    
                  CategoryButton(
                    label: 'Galletas',
                    onTap: (){seleccionarProductoController.setCategoryIndex(2);},
                    selected: (seleccionarProductoController.categotyIndex.value == 2) ? true : false,
                  ),

                  CategoryButton(
                    label: 'Otros',
                    onTap: (){seleccionarProductoController.setCategoryIndex(3);},
                    selected: (seleccionarProductoController.categotyIndex.value == 3) ? true : false,
                  ),
                ]
              ),
            ),
    
            Expanded(
              child: ListView.builder(
                itemCount: getCategoryFromIdex(seleccionarProductoController.categotyIndex.value).length,
                itemBuilder: (context, index) => ListTile(
                  onTap: (){seleccionarProductoController.onProductoTap(getCategoryFromIdex(seleccionarProductoController.categotyIndex.value)[index]);},
                  leading: Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    height: 40,
                    width: 40,
                    child: Image.asset(
                      'lib/resources/productos/${getCategoryFromIdex(seleccionarProductoController.categotyIndex.value)[index].nombre}.png',
                    ),
                  ),
                  title: Text(getCategoryFromIdex(seleccionarProductoController.categotyIndex.value)[index].nombre)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}