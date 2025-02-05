// To parse this JSON data, do
//
//     final dataList = dataListFromJson(jsonString);

import 'dart:convert';

List<DataList> dataListFromJson(String str) => List<DataList>.from(json.decode(str).map((x) => DataList.fromJson(x)));

String dataListToJson(List<DataList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataList {
  final int albumId;
  final int id;
  final String title;
  final String url;
  final String thumbnailUrl;

  DataList({
    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  DataList copyWith({
    int? albumId,
    int? id,
    String? title,
    String? url,
    String? thumbnailUrl,
  }) =>
      DataList(
        albumId: albumId ?? this.albumId,
        id: id ?? this.id,
        title: title ?? this.title,
        url: url ?? this.url,
        thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      );

  factory DataList.fromJson(Map<String, dynamic> json) => DataList(
    albumId: json["albumId"],
    id: json["id"],
    title: json["title"],
    url: json["url"],
    thumbnailUrl: json["thumbnailUrl"],
  );

  Map<String, dynamic> toJson() => {
    "albumId": albumId,
    "id": id,
    "title": title,
    "url": url,
    "thumbnailUrl": thumbnailUrl,
  };
}
