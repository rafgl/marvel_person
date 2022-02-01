import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/args/characterDetailsArgs.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/repositories/marvel_repository.dart';

class CharacterDetailController extends GetxController {
  GetAPIRepository homeRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  late final CharacterDetailsArgs characterDetailsArgs;
  late final CharacterModel characters;

  @override
  void onInit() async {
    super.onInit();
    characterDetailsArgs = Get.arguments as CharacterDetailsArgs;
    characters = characterDetailsArgs.character!;
  }
}
