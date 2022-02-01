import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/models/comics_model.dart';
import 'package:marvel_persons/repositories/marvel_repository.dart';
import 'package:marvel_persons/utils/colors.dart';

class ComicsController extends GetxController {
  RxList<ComicsModel> comic = RxList<ComicsModel>();
  GetAPIRepository personsRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  final TextEditingController _filterSearch = TextEditingController();
  TextEditingController get filterSearch => _filterSearch;

  @override
  void onInit() async {
    super.onInit();

    await getCreator();
  }

  Future<void> getCreator() async {
    List<ComicsModel> comics = await personsRepository.getComics();
    comic.value = comics;
  }

  getComicsForTitle(String title) async {
    List<ComicsModel> comics = await personsRepository.getComicsForTitle(title);

    if (comics.length == 0) {
      Fluttertoast.showToast(
          backgroundColor: MyColors.error, msg: "Não encontrado este comic");
    }
    comic.value = comics;
  }
}
