import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/utils/rutes.dart';

class SplashController extends GetxController {
  @override
  void onReady() async {
    super.onReady();

    Get.offNamed(Routes.home);
  }
}
