// ignore_for_file: avoid_print

import 'package:marvel_persons/models/character_model.dart';

class HomeRepository {
  // final HttpService _httpProvider = Get.find<HttpService>();

  Future<List<Character>> getCharacter() async {
    try {
      // final response = await _httpProvider.get(
      //     'characters?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}');
      // List<Character> posts = List.from(response.body['data']['results'])
      //     .map(
      //       (e) => Character.fromMap(e),
      //     )
      //     .toList();
      // print(response.body['data']['results']);
      return [];
    } catch (e) {
      return [];
    }
  }
}
