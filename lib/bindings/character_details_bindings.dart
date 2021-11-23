import 'package:get/get.dart';
import 'package:marvel_persons/controllers/character_detail.dart';

class CharacterDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<CharacterDetailController>(
      CharacterDetailController(),
    );
  }
}
