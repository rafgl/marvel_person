import 'package:get/get.dart';
import 'package:marvel_persons/controllers/comics/comics_controller.dart';

class ComicsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<ComicsController>(
      ComicsController(),
    );
  }
}
