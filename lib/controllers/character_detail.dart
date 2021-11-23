import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/args/characterDetailsArgs.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/repositories/home_repository.dart';

class CharacterDetailController extends GetxController {
  Rx<List<Character>> character = Rx<List<Character>>([]);
  HomeRepository homeRepository = HomeRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  late final CharacterDetailsArgs characterDetailsArgs;
  late final Character characters;

  @override
  void onInit() async {
    super.onInit();
    characterDetailsArgs = Get.arguments as CharacterDetailsArgs;
    characters = characterDetailsArgs.character!;
  }

  // @override
  // Future<void> refresh() async {
  //   _loading.value = true;
  //   await getCharacter();

  //   _loading.value = false;
  // }

  // Future<void> getCharacter() async {
  //   List<Character> characters = await homeRepository.getCharacter();
  //   character.value = characters;
  // }
}
