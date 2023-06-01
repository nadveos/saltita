// To parse this JSON data, do
//
//     final test = testFromMap(jsonString);

import 'dart:convert';

class ResultBandas {
  ResultBandas({
    required this.page,
    required this.perPage,
    required this.totalItems,
    required this.totalPages,
    required this.items,
  });

  int page;
  int perPage;
  int totalItems;
  int totalPages;
  List<Item> items;

  factory ResultBandas.fromJson(String str) =>
      ResultBandas.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResultBandas.fromMap(Map<String, dynamic> json) => ResultBandas(
        page: json["page"],
        perPage: json["perPage"],
        totalItems: json["totalItems"],
        totalPages: json["totalPages"],
        items: List<Item>.from(json["items"].map((x) => Item.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "page": page,
        "perPage": perPage,
        "totalItems": totalItems,
        "totalPages": totalPages,
        "items": List<dynamic>.from(items.map((x) => x.toMap())),
      };
}

class Item {
  Item(
      {required this.collectionId,
      required this.collectionName,
      required this.created,
      required this.desc,
      required this.genre,
      required this.id,
      required this.field,
      required this.img1,
      required this.name,
      required this.updated,
      required this.facebook,
      required this.youtube,
      required this.instagram,
      required this.spotify,
      required this.apple});

  String collectionId;
  String collectionName;
  DateTime created;
  String desc;
  String genre;
  String id;
  String? field;
  String img1;
  String name;
  DateTime updated;
  String? facebook;
  String? youtube;
  String? instagram;
  String? spotify;
  String? apple;

  factory Item.fromJson(String str) => Item.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Item.fromMap(Map<String, dynamic> json) => Item(
        collectionId: json["collectionId"],
        collectionName: json["collectionName"],
        created: DateTime.parse(json["created"]),
        desc: json["desc"],
        genre: json["genre"],
        id: json["id"],
        field: json["field"],
        img1: json["img1"],
        name: json["name"],
        updated: DateTime.parse(json["updated"]),
        facebook: json["facebook"],
        youtube: json["youtube"],
        instagram: json["instagram"],
        spotify: json["spotify"],
        apple: json["apple"],
      );

  Map<String, dynamic> toMap() => {
        "collectionId": collectionId,
        "collectionName": collectionName,
        "created": created.toIso8601String(),
        "desc": desc,
        "genre": genre,
        "id": id,
        "field": field,
        "img1": img1,
        "name": name,
        "updated": updated.toIso8601String(),
        "facebook": facebook,
        "youtube": youtube,
        "instagram": instagram,
        "spotify": spotify,
        "apple": apple,
      };
  getImageUrl() {
    if (field == null) {
      return 'https://miro.medium.com/max/500/0*-ouKIOsDCzVCTjK-.png';
    } else {
      return 'https://saltita.meapp.online/api/files/$collectionId/$id/$field';
    }
  }
}
