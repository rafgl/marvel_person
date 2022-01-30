import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/models/creators_model.dart';
import 'package:marvel_persons/models/listsForPersons.dart';
import 'package:marvel_persons/repositories/get_for_api_repository.dart';
import 'package:marvel_persons/services/auth.dart';
import 'package:marvel_persons/utils/routes.dart';

class DashboardController extends GetxController {
  final AuthService authService;

  DashboardController({required this.authService});

  RxList<CharacterModel> character = RxList<CharacterModel>();
  RxList<CreatorModel> creator = RxList<CreatorModel>();
  RxList<CharacterModel> comicsc = RxList<CharacterModel>();

  GetAPIRepository characterRepository = GetAPIRepository();
  RxList<ListsForPersons> listsForPersons = RxList<ListsForPersons>();

  final _loading = RxBool(false);
  bool get loading => _loading.value;

  @override
  void onInit() async {
    super.onInit();
    _loading.value = true;

    await getCharacter();

    await getCreator();

    listsForPersons.add(
      ListsForPersons(
        title: "Personagens",
        route: Routes.characters,
        count: character.length,
        color: Colors.cyan,
      ),
    );
    listsForPersons.add(
      ListsForPersons(
        title: "Criadores",
        route: Routes.creators,
        list: creator,
        count: creator.length,
        color: Colors.green,
      ),
    );
    listsForPersons.add(
      ListsForPersons(
        title: "HQs",
        route: Routes.hqs,
        color: Colors.deepPurple,
      ),
    );
    _loading.value = false;
  }

  getCharacter() async {
    List<CharacterModel> characters = await characterRepository.getCharacter();
    character.value = characters;
  }

  getCreator() async {
    List<CreatorModel> creators = await characterRepository.getCreator();
    creator.value = creators;
  }

  getHQS() async {
    List<CharacterModel> characters = await characterRepository.getCharacter();
    character.value = characters;
  }
}
