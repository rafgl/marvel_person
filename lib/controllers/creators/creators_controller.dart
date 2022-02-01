import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:marvel_persons/models/creators_model.dart';
import 'package:marvel_persons/repositories/marvel_repository.dart';
import 'package:marvel_persons/utils/colors.dart';

class CreatorsController extends GetxController {
  RxList<CreatorModel> creator = RxList<CreatorModel>();
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
    List<CreatorModel> creators = await personsRepository.getCreator();
    creator.value = creators;
  }

  getCreatorForName(String title) async {
    List<CreatorModel> creators =
        await personsRepository.getCreatorForName(title);

    if (creators.length == 0) {
      Fluttertoast.showToast(
          backgroundColor: MyColors.error, msg: "Não encontrado este criador");
    }
    creator.value = creators;
  }
}
