import 'package:get/get.dart';
import 'package:marvel_persons/controllers/dashboard_controller.dart';
import 'package:marvel_persons/services/auth.dart';

class DashboardBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<DashboardController>(
      DashboardController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
