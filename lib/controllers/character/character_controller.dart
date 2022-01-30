import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/repositories/get_for_api_repository.dart';
import 'package:marvel_persons/services/auth.dart';

class CharacterController extends GetxController {
  final AuthService authService;

  RxList<CharacterModel> character = RxList<CharacterModel>();
  GetAPIRepository personsRepository = GetAPIRepository();

  CharacterController({required this.authService});

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  @override
  void onInit() async {
    super.onInit();

    await getCharacter();
  }

  Future<void> getCharacter() async {
    List<CharacterModel> characters = await personsRepository.getCharacter();
    character.value = characters;
  }
}
