import 'dart:convert';
import 'Course.dart';
import 'Publisher.dart';

Media mediaFromJson(String str) => Media.fromJson(json.decode(str));

String mediaToJson(Media data) => json.encode(data.toJson());

class Media {
  String id;
  String classId;
  String shortDescription;
  String fileUrl;
  String subject;
  String contentType;
  DateTime createdAt;
  DateTime updatedAt;
  String coverImg;
  String title;
  Publisher? publisher;

  Media({
    required this.id,
    required this.classId,
    required this.shortDescription,
    required this.fileUrl,
    required this.subject,
    required this.contentType,
    required this.createdAt,
    required this.updatedAt,
    required this.coverImg,
    required this.title,
    required this.publisher,


  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
    id: json["id"],
    classId: json["classId"],
    shortDescription: json["description"],
    fileUrl: json["fileUrl"],
    subject: json["subject"],
    coverImg: json["coverImg"],
    contentType: json["type"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publisher: Publisher.fromJson(json["publisher"]),
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "classId": classId,
    "short_description": shortDescription,
    "fileUrl": fileUrl,
    "subject": subject,
    "coverImg": coverImg,
    "content_type": contentType,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "publisher": publisher?.toJson(),
    "title": title,
  };
}
