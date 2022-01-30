import 'package:get/get.dart';
import 'package:marvel_persons/controllers/login_controller.dart';
import 'package:marvel_persons/services/auth.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<LoginController>(
      LoginController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
