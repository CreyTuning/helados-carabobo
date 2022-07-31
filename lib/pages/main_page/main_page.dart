import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:mispedidos/pages/clientes_page/clientes_page.dart';
import 'package:mispedidos/pages/facturas_page/facturas_page.dart';
import 'package:mispedidos/pages/main_page/main_page_controller.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    MainPageController mainPageController = Get.put(MainPageController());

    return Obx(
      () => Scaffold(

        body: indexToPage(mainPageController.currentIndex.value),

        bottomNavigationBar: BottomNavigationBar(
          currentIndex: mainPageController.currentIndex.value,
          onTap: mainPageController.onTap,

          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.list_alt_rounded),
              label: 'Facturas'
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_rounded),
              label: 'Clientes'
            )
          ],
        ),
      ),
    );
  }

  StatelessWidget indexToPage(int index){
    StatelessWidget page = Container();

    switch (index) {
      case 0:
        page = const FacturasPage();
        break;
      case 1:
        page = const ClientesPage();
        break;
    }

    return page;
  }
}