import 'package:data7_api_pix_config/app/modules/manager_config/manager_controller.dart';
import 'package:get/get.dart';

class ManagerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ManagerController>(() => ManagerController());
  }
}
