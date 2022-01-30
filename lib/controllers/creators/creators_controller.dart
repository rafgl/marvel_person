import 'package:get/get.dart';
import 'package:marvel_persons/models/creators_model.dart';
import 'package:marvel_persons/repositories/get_for_api_repository.dart';

class CreatorsController extends GetxController {
  RxList<CreatorModel> creator = RxList<CreatorModel>();
  GetAPIRepository personsRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  int soma = 10;

  @override
  void onInit() async {
    super.onInit();

    await getCreator();
  }

  Future<void> getCreator() async {
    List<CreatorModel> creators = await personsRepository.getCreator();
    creator.value = creators;
    print(creators);
  }
}
