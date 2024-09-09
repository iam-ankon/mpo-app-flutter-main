import 'package:amin_agent/app/data/utils/controller/utils_controller.dart';
import 'package:get/get.dart';

class UtilsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => UtilsController());
  }
}
