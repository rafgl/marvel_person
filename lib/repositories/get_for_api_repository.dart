// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/models/creators_model.dart';
import 'package:marvel_persons/services/http.dart';
import 'package:marvel_persons/utils/config.dart';

class GetAPIRepository {
  final HttpService _httpProvider = Get.find<HttpService>();

  Future<List<CharacterModel>> getCharacterLoadMore(int? offset) async {
    try {
      final response = await _httpProvider.get(
          'characters?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=10&offset=$offset');
      List<CharacterModel> posts = List.from(response.body['data']['results'])
          .map(
            (e) => CharacterModel.fromMap(e),
          )
          .toList();
      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<List<CharacterModel>> getCharacter() async {
    try {
      final response = await _httpProvider.get(
          'characters?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=50');

      List<CharacterModel> posts = List.from(response.body['data']['results'])
          .map(
            (e) => CharacterModel.fromMap(e),
          )
          .toList();
      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<List<CreatorModel>> getCreator() async {
    try {
      final response = await _httpProvider
          .get('creators?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}');

      List<CreatorModel> posts = List.from(response.body['data']['results'])
          .map(
            (e) => CreatorModel.fromMap(e),
          )
          .toList();
      return posts;
    } catch (e) {
      return [];
    }
  }

  Future<List<CharacterModel>> getHQS() async {
    try {
      final response = await _httpProvider.get(
          'comicsc?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=50');
      List<CharacterModel> posts = List.from(response.body['data']['results'])
          .map(
            (e) => CharacterModel.fromMap(e),
          )
          .toList();
      return posts;
    } catch (e) {
      return [];
    }
  }
}
