import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/repositories/home_repository.dart';

class HomeController extends GetxController {
  RxList<Character> character = RxList<Character>();
  HomeRepository homeRepository = HomeRepository();

  final RxBool _refreshCategory = RxBool(true);
  bool get refreshCategory => _refreshCategory.value;

  final RxBool _loading = RxBool(true);
  bool get loading => _loading.value;

  int _currentPage = 10;
  int soma = 10;

  @override
  void onInit() async {
    super.onInit();

    await getCharacter();
  }

  @override
  Future<void> refresh() async {
    _loading.value = true;
    await getCharacter();

    _loading.value = false;
  }

  Future<void> getCharacter() async {
    List<Character> characters = await homeRepository.getCharacter();
    character.value = characters;
  }

  Future<void> getCharacterLoadMore() async {
    // soma + _currentPage == soma;
    // soma;
    print(soma);
    // List<Character> _result = await homeRepository.getCharacterLoadMore(soma);

    // character.addAll(_result);
    character.refresh();
  }
}
