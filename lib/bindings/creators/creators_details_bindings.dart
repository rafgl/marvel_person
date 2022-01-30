import 'package:get/get.dart';
import 'package:marvel_persons/controllers/creators/creators_detail_controller.dart';

class CreatorsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CreatorsDetailController>(
      CreatorsDetailController(),
    );
  }
}
