import 'package:get/get.dart';
import 'package:marvel_persons/controllers/creators/creators_controller.dart';

class CreatorsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<CreatorsController>(
      CreatorsController(),
    );
  }
}
