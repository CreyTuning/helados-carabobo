import 'package:get/get.dart';
import 'package:mispedidos/objects/cliente.dart';
import 'package:mispedidos/pages/solicitudes_page/views/crear_solicitud/crear_solicitud.dart';
import 'package:mispedidos/pages/solicitudes_page/views/seleccionar_producto/selecionar_producto.dart';

class SolicitudesController extends GetxController{
  Cliente cliente = Cliente(nombre: '');
  
  @override
  void onInit() {
    cliente = Get.arguments;
    super.onInit();
  }

  void onAgregarTap(){
    Get.to(()=> const CrearSolicitud(
      esNueva: true,
    ));
  }
}