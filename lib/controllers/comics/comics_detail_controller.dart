import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/args/comicsDetailsArgs.dart';
import 'package:marvel_persons/models/comics_model.dart';
import 'package:marvel_persons/repositories/marvel_repository.dart';

class ComicsDetailController extends GetxController {
  GetAPIRepository homeRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  late final ComicsDetailsArgs comicDetailsArgs;
  late final ComicsModel comics;

  @override
  void onInit() async {
    super.onInit();
    comicDetailsArgs = Get.arguments as ComicsDetailsArgs;
    comics = comicDetailsArgs.comics!;
    print(
        "comics.characters!.items!.length ${comics.characters!.items!.length}");
  }
}
