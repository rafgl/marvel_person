import 'dart:convert';

class CreatorModel {
  CreatorModel({
    this.id,
    this.firstName,
    this.middleName,
    this.lastName,
    this.suffix,
    this.fullName,
    this.modified,
    this.thumbnail,
    this.resourceUri,
    this.comics,
    this.series,
    this.stories,
    this.events,
    this.urls,
  });

  int? id;
  String? firstName;
  String? middleName;
  String? lastName;
  String? suffix;
  String? fullName;
  String? modified;
  Thumbnail? thumbnail;
  String? resourceUri;
  Comics? comics;
  Comics? series;
  Stories? stories;
  Comics? events;
  List<Url>? urls;

  factory CreatorModel.fromJson(String str) =>
      CreatorModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory CreatorModel.fromMap(Map<String, dynamic> json) => CreatorModel(
        id: json["id"],
        firstName: json["firstName"],
        lastName: json["lastName"],
        suffix: json["suffix"],
        fullName: json["fullName"],
        modified: json["modified"],
        thumbnail: Thumbnail.fromJson(json["thumbnail"]),
        resourceUri: json["resourceURI"],
        comics: Comics.fromJson(json["comics"]),
        series: Comics.fromJson(json["series"]),
        stories: Stories.fromJson(json["stories"]),
        events: Comics.fromJson(json["events"]),
        urls: List<Url>.from(json["urls"].map((x) => Url.fromJson(x))),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "firstName": firstName,
        "lastName": lastName,
        "suffix": suffix,
        "fullName": fullName,
        "modified": modified,
        "thumbnail": thumbnail!.toJson(),
        "resourceURI": resourceUri,
        "comics": comics!.toJson(),
        "series": series!.toJson(),
        "stories": stories!.toJson(),
        "events": events!.toJson(),
        "urls": List<dynamic>.from(urls!.map((x) => x.toJson())),
      };
}

class Comics {
  Comics({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<ComicsItem>? items;
  int? returned;

  factory Comics.fromJson(Map<String, dynamic> json) => Comics(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<ComicsItem>.from(
            json["items"].map((x) => ComicsItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class ComicsItem {
  ComicsItem({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory ComicsItem.fromJson(Map<String, dynamic> json) => ComicsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Stories {
  Stories({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<StoriesItem>? items;
  int? returned;

  factory Stories.fromJson(Map<String, dynamic> json) => Stories(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<StoriesItem>.from(
            json["items"].map((x) => StoriesItem.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class StoriesItem {
  StoriesItem({
    this.resourceUri,
    this.name,
    this.type,
  });

  String? resourceUri;
  String? name;
  ItemType? type;

  factory StoriesItem.fromJson(Map<String, dynamic> json) => StoriesItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        type: itemTypeValues.map![json["type"]],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": itemTypeValues.reverse![type],
      };
}

enum ItemType { COVER, INTERIOR_STORY, EMPTY }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "": ItemType.EMPTY,
  "interiorStory": ItemType.INTERIOR_STORY
});

class Thumbnail {
  Thumbnail({
    this.path,
    this.extension,
  });

  String? path;
  Extension? extension;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"],
        extension: extensionValues.map![json["extension"]],
      );

  Map<String, dynamic> toJson() => {
        "path": path,
        "extension": extensionValues.reverse![extension],
      };
}

enum Extension { JPG, GIF }

final extensionValues =
    EnumValues({"gif": Extension.GIF, "jpg": Extension.JPG});

class Url {
  Url({
    this.type,
    this.url,
  });

  UrlType? type;
  String? url;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: urlTypeValues.map![json["type"]],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": urlTypeValues.reverse![type],
        "url": url,
      };
}

enum UrlType { DETAIL, WIKI, COMICLINK }

final urlTypeValues = EnumValues({
  "comiclink": UrlType.COMICLINK,
  "detail": UrlType.DETAIL,
  "wiki": UrlType.WIKI
});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
