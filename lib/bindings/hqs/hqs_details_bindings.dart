import 'package:get/get.dart';
import 'package:marvel_persons/controllers/hqs/hqs_detail_controller.dart';

class HQSDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<HQSDetailController>(
      HQSDetailController(),
    );
  }
}
