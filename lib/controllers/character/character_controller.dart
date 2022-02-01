import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/repositories/marvel_repository.dart';
import 'package:marvel_persons/services/auth.dart';
import 'package:marvel_persons/utils/colors.dart';

class CharacterController extends GetxController {
  final AuthService authService;

  RxList<CharacterModel> character = RxList<CharacterModel>();
  GetAPIRepository personsRepository = GetAPIRepository();

  CharacterController({required this.authService});

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final TextEditingController _filterSearch = TextEditingController();
  TextEditingController get filterSearch => _filterSearch;

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

  getCharacterForName(String name) async {
    List<CharacterModel> characters =
        await personsRepository.getCharacterForName(name);

    if (characters.length == 0) {
      Fluttertoast.showToast(
          backgroundColor: MyColors.error,
          msg: "Não encontrado este personagem");
    }
    character.value = characters;
  }
}
