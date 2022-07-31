import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MainPageController extends GetxController {
  Rx<int> currentIndex = 0.obs;


  void onTap(int index){
    currentIndex.value = index;
  }
}