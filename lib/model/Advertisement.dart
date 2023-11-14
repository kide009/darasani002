import 'dart:convert';
import 'package:darasani/model/Cartegory.dart';
import 'package:darasani/model/User.dart';

Advertisement advertisementFromJson(String str) => Advertisement.fromJson(json.decode(str));

String advertisementToJson(Advertisement data) => json.encode(data.toJson());

class Advertisement {
  String id;
  String title;
  String coverImg;
  String description;
  DateTime createdAt;
  DateTime updatedAt;
  String creatorId;

  Advertisement({
    required this.id,
   // required this.uploadedBy,
   // required this.categoryId,
    //required this.subjectId,
    required this.title,
    required this.coverImg,
    required this.creatorId,
    required this.description,
    required this.createdAt,
    required this.updatedAt,
   // required this.category,
    //required this.user,
  });

  factory Advertisement.fromJson(Map<String, dynamic> json) => Advertisement(
    id: json["id"],
    creatorId: json["creatorId"],
    title: json["title"],
    coverImg: json["coverImg"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "coverImg": coverImg,
    "description": description,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
  };
}