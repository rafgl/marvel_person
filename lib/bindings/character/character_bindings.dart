import 'package:get/get.dart';
import 'package:marvel_persons/controllers/character/character_controller.dart';
import 'package:marvel_persons/services/auth.dart';

class CharacterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CharacterController>(
      CharacterController(
        authService: Get.find<AuthService>(),
      ),
    );
  }
}
