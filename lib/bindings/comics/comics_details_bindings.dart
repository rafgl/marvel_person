import 'package:get/get.dart';
import 'package:marvel_persons/controllers/comics/comics_detail_controller.dart';

class ComicsDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<ComicsDetailController>(
      ComicsDetailController(),
    );
  }
}
