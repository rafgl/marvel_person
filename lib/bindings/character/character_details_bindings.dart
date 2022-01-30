import 'package:get/get.dart';
import 'package:marvel_persons/controllers/character/character_detail_controller.dart';

class CharacterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CharacterDetailController>(
      CharacterDetailController(),
    );
  }
}
