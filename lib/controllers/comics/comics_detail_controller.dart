import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/args/characterDetailsArgs.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/repositories/get_for_api_repository.dart';

class ComicsDetailController extends GetxController {
  Rx<List<CharacterModel>> character = Rx<List<CharacterModel>>([]);
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
    print(characterDetailsArgs.character!.comics!.items!.length);
  }
}
