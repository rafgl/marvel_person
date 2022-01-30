import 'package:get/get.dart';
import 'package:marvel_persons/controllers/hqs/hqs_controller.dart';

class HQSBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<HQSController>(
      HQSController(),
    );
  }
}
