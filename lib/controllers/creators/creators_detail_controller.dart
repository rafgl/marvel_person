import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/args/creatorDetailsArgs.dart';
import 'package:marvel_persons/models/creators_model.dart';
import 'package:marvel_persons/repositories/get_for_api_repository.dart';

class CreatorsDetailController extends GetxController {
  GetAPIRepository personsRepository = GetAPIRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  late final CreatorsDetailsArgs creatorDetailsArgs;
  late final CreatorModel creators;

  @override
  void onInit() async {
    super.onInit();
    creatorDetailsArgs = Get.arguments as CreatorsDetailsArgs;
    creators = creatorDetailsArgs.creator!;
  }
}
