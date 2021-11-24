// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/services/http.dart';
import 'package:marvel_persons/utils/config.dart';

class HomeRepository {
  final HttpService _httpProvider = Get.find<HttpService>();

  Future<List<Character>> getCharacterLoadMore(int? offset) async {
    try {
      final response = await _httpProvider.get(
          'characters?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=10&offset=$offset');
      List<Character> posts = List.from(response.body['data']['results'])
          .map(
            (e) => Character.fromMap(e),
          )
          .toList();
      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<List<Character>> getCharacter() async {
    try {
      final response = await _httpProvider.get(
          'characters?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=10');
      List<Character> posts = List.from(response.body['data']['results'])
          .map(
            (e) => Character.fromMap(e),
          )
          .toList();
      return posts;
    } catch (e) {
      return [];
    }
  }
}
