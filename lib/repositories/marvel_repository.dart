// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:marvel_persons/models/character_model.dart';
import 'package:marvel_persons/models/creators_model.dart';
import 'package:marvel_persons/models/comics_model.dart';
import 'package:marvel_persons/services/http.dart';
import 'package:marvel_persons/utils/config.dart';

class GetAPIRepository {
  final HttpService _httpProvider = Get.find<HttpService>();

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

  Future<List<CharacterModel>> getCharacterForName(String name) async {
    try {
      final response = await _httpProvider.get(
          'characters?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&name=$name');

      if (response.body['data']['total'] == 0) {
        return [];
      }
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

  Future<List<CreatorModel>> getCreatorForName(String name) async {
    try {
      final response = await _httpProvider.get(
          'creators?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&&firstName=$name');

      if (response.body['data']['total'] == 0) {
        return [];
      }
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

  Future<List<CreatorModel>> getCreator() async {
    try {
      final response = await _httpProvider.get(
          'creators?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=50');

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

  Future<List<ComicsModel>> getComics() async {
    try {
      final response = await _httpProvider.get(
          'comics?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&limit=50');
      List<dynamic> parsedListJson = response.body['data']['results'];

      List<ComicsModel> itemsList = List<ComicsModel>.from(
          parsedListJson.map((i) => ComicsModel.fromJson(i)));

      return itemsList;
    } catch (e) {
      return [];
    }
  }

  Future<List<ComicsModel>> getComicsForTitle(String title) async {
    try {
      final response = await _httpProvider.get(
          'comics?ts=1&apikey=${Config.PUBLICKEY}&hash=${Config.HASH}&title=$title');

      if (response.body['data']['total'] == 0) {
        return [];
      }
      List<dynamic> parsedListJson = response.body['data']['results'];

      List<ComicsModel> itemsList = List<ComicsModel>.from(
          parsedListJson.map((i) => ComicsModel.fromJson(i)));

      return itemsList;
    } catch (e) {
      return [];
    }
  }
}
