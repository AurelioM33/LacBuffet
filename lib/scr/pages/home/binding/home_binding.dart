import 'package:get/get.dart';
import 'package:lac_buffet/scr/pages/home/controller/home_controller.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
