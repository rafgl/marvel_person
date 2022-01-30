import 'package:get/get.dart';
import 'package:marvel_persons/controllers/splash_controller.dart';
import 'package:marvel_persons/services/auth.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(
      SplashController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
