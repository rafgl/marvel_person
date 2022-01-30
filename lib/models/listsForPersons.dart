import 'package:flutter/material.dart';

import 'character_model.dart';

class ListsForPersons {
  final String? title;
  final String? subtitle;
  final List? list;
  final String? route;
  final Color? color;
  final CharacterModel? character;
  final int? count;

  ListsForPersons({
    this.title,
    this.subtitle,
    this.route,
    this.list,
    this.color,
    this.character,
    this.count,
  });
}
