class ComicsModel {
  ComicsModel({
    this.id,
    this.digitalId,
    this.title,
    this.issueNumber,
    this.variantDescription,
    this.description,
    this.modified,
    this.isbn,
    this.upc,
    this.diamondCode,
    this.ean,
    this.issn,
    this.format,
    this.pageCount,
    this.textObjects,
    this.resourceUri,
    this.urls,
    this.series,
    this.variants,
    this.collections,
    this.collectedIssues,
    this.dates,
    this.prices,
    this.thumbnail,
    this.images,
    this.creators,
    this.characters,
    this.stories,
    this.events,
  });

  int? id;
  int? digitalId;
  String? title;
  int? issueNumber;
  String? variantDescription;
  String? description;
  String? modified;
  String? isbn;
  String? upc;
  DiamondCode? diamondCode;
  String? ean;
  String? issn;
  Format? format;
  int? pageCount;
  List<TextObject>? textObjects;
  String? resourceUri;
  List<Url>? urls;
  Series? series;
  List<Series>? variants;
  List<dynamic>? collections;
  List<Series>? collectedIssues;
  List<Date>? dates;
  List<Price>? prices;
  Thumbnail? thumbnail;
  List<Thumbnail>? images;
  Creators? creators;
  Characters? characters;
  Stories? stories;
  Characters? events;

  ComicsModel.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? "";
    title = json["title"] ?? "";
    description = json["description"] ?? "";
    pageCount = json["pageCount"] ?? "";
    series = json["series"] == null ? null : Series.fromJson(json["series"]);
    collections = json["collections"] == null
        ? null
        : new List<dynamic>.from(json["collections"].map((x) => x));
    collectedIssues = json["collectedIssues"] == null
        ? null
        : new List<Series>.from(
            json["collectedIssues"].map((x) => Series.fromJson(x)));
    thumbnail = json["thumbnail"] == null
        ? null
        : new Thumbnail.fromJson(json["thumbnail"]);
  }
}

class Characters {
  Characters({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<Series>? items;
  int? returned;

  factory Characters.fromJson(Map<String, dynamic> json) => Characters(
        available: json["available"],
        collectionUri: json["collectionURI"],
        items: List<Series>.from(json["items"].map((x) => Series.fromJson(x))),
        returned: json["returned"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class Series {
  Series({
    this.resourceUri,
    this.name,
  });

  String? resourceUri;
  String? name;

  factory Series.fromJson(Map<String, dynamic> json) => Series(
        resourceUri: json["resourceURI"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
      };
}

class Creators {
  Creators({
    this.available,
    this.collectionUri,
    this.items,
    this.returned,
  });

  int? available;
  String? collectionUri;
  List<CreatorsItem>? items;
  int? returned;

  factory Creators.fromJson(Map<String, dynamic> json) => Creators(
        available: json["available"] ?? "",
        collectionUri: json["collectionURI"] ?? "",
        items: json["items"] == null
            ? null
            : List<CreatorsItem>.from(
                json["items"].map((x) => CreatorsItem.fromJson(x))),
        returned: json["returned"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "collectionURI": collectionUri,
        "items": List<dynamic>.from(items!.map((x) => x.toJson())),
        "returned": returned,
      };
}

class CreatorsItem {
  CreatorsItem({
    this.resourceUri,
    this.name,
    this.role,
  });

  String? resourceUri;
  String? name;
  Role? role;

  factory CreatorsItem.fromJson(Map<String, dynamic> json) => CreatorsItem(
        resourceUri: json["resourceURI"],
        name: json["name"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "role": role,
      };
}

enum Role {
  EDITOR,
  WRITER,
  PENCILLER,
  PENCILLER_COVER,
  COLORIST,
  INKER,
  LETTERER,
  PENCILER
}

final roleValues = EnumValues({
  "colorist": Role.COLORIST,
  "editor": Role.EDITOR,
  "inker": Role.INKER,
  "letterer": Role.LETTERER,
  "penciler": Role.PENCILER,
  "penciller": Role.PENCILLER,
  "penciller (cover)": Role.PENCILLER_COVER,
  "writer": Role.WRITER
});

class Date {
  Date({
    this.type,
    this.date,
  });

  DateType? type;
  String? date;

  factory Date.fromJson(Map<String, dynamic> json) => Date(
        type: json["type"],
        date: json["date"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "date": date,
      };
}

enum DateType { ONSALE_DATE, FOC_DATE }

final dateTypeValues = EnumValues(
    {"focDate": DateType.FOC_DATE, "onsaleDate": DateType.ONSALE_DATE});

enum DiamondCode { EMPTY, JUL190068 }

final diamondCodeValues =
    EnumValues({"": DiamondCode.EMPTY, "JUL190068": DiamondCode.JUL190068});

enum Format { EMPTY, COMIC, TRADE_PAPERBACK, DIGEST }

final formatValues = EnumValues({
  "Comic": Format.COMIC,
  "Digest": Format.DIGEST,
  "": Format.EMPTY,
  "Trade Paperback": Format.TRADE_PAPERBACK
});

class Thumbnail {
  Thumbnail({
    this.path,
  });

  String? path;

  factory Thumbnail.fromJson(Map<String, dynamic> json) => Thumbnail(
        path: json["path"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "path": path ?? "",
      };
}

enum Extension { JPG }

final extensionValues = EnumValues({"jpg": Extension.JPG});

class Price {
  Price({
    this.type,
    this.price,
  });

  PriceType? type;
  double? price;

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        type: json["type"] ?? "",
        price: json["price"].toDouble() ?? "",
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "price": price,
      };
}

enum PriceType { PRINT_PRICE }

final priceTypeValues = EnumValues({"printPrice": PriceType.PRINT_PRICE});

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
        type: json["type"],
      );

  Map<String, dynamic> toJson() => {
        "resourceURI": resourceUri,
        "name": name,
        "type": type,
      };
}

enum ItemType { COVER, INTERIOR_STORY, PROMO }

final itemTypeValues = EnumValues({
  "cover": ItemType.COVER,
  "interiorStory": ItemType.INTERIOR_STORY,
  "promo": ItemType.PROMO
});

class TextObject {
  TextObject({
    this.type,
    this.language,
    this.text,
  });

  TextObjectType? type;
  Language? language;
  String? text;

  factory TextObject.fromJson(Map<String, dynamic> json) => TextObject(
        type: json["type"],
        language: json["language"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "language": language,
        "text": text,
      };
}

enum Language { EN_US }

final languageValues = EnumValues({"en-us": Language.EN_US});

enum TextObjectType { ISSUE_SOLICIT_TEXT }

final textObjectTypeValues =
    EnumValues({"issue_solicit_text": TextObjectType.ISSUE_SOLICIT_TEXT});

class Url {
  Url({
    this.type,
    this.url,
  });

  UrlType? type;
  String? url;

  factory Url.fromJson(Map<String, dynamic> json) => Url(
        type: json["type"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "type": type,
        "url": url,
      };
}

enum UrlType { DETAIL, PURCHASE }

final urlTypeValues =
    EnumValues({"detail": UrlType.DETAIL, "purchase": UrlType.PURCHASE});

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map!.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
