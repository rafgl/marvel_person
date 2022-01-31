import 'package:get/get.dart';
import 'package:marvel_persons/models/comics_model.dart';
import 'package:marvel_persons/repositories/get_for_api_repository.dart';

class ComicsController extends GetxController {
  RxList<ComicsModel> comic = RxList<ComicsModel>();
  GetAPIRepository personsRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  @override
  void onInit() async {
    super.onInit();

    await getCreator();
  }

  Future<void> getCreator() async {
    List<ComicsModel> comics = await personsRepository.getComics();
    comic.value = comics;
  }
}
