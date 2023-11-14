import 'dart:convert';
import 'package:darasani/model/Cartegory.dart';
import 'package:darasani/model/Publisher.dart';
import 'package:darasani/model/User.dart';

Library libraryFromJson(String str) => Library.fromJson(json.decode(str));

String libraryToJson(Library data) => json.encode(data.toJson());

class Library {
  String id;
  //String uploadedBy;
  String publisherId;
  //String subject;
  String title;
  String coverImg;
  String classId;
  String description;
  int price;
  String fileUrl;
  DateTime createdAt;
  DateTime updatedAt;
  //String publisher;
  String subject;
  Publisher? publisher;
  //User user;

  Library({
    required this.id,
   // required this.uploadedBy,
    required this.publisherId,
    //required this.subjectId,
    required this.title,
    required this.coverImg,
    required this.classId,
    required this.description,
    required this.price,
    required this.fileUrl,
    required this.createdAt,
    required this.updatedAt,
    required this.publisher,
    required this.subject,
   // required this.category,
    //required this.user,
  });

  factory Library.fromJson(Map<String, dynamic> json) => Library(
    id: json["id"],
    subject: json["subject"],
    //uploadedBy: json["uploaded_by"],
    publisherId: json["publisherId"],
    //subjectId: json["subject_id"],
    title: json["title"],
    coverImg: json["coverImg"],
    classId: json["classId"],
    description: json["description"],
    price: json["price"],
    fileUrl: json["fileUrl"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    publisher: Publisher.fromJson(json["publisher"]),
    //user: User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    //"uploaded_by": uploadedBy,
    //"category_id": categoryId,
    //"subject": subject,
    "title": title,
    "coverImg": coverImg,
    "classId": classId,
    "description": description,
    "price": price,
    "fileUrl": fileUrl,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "publisher": publisher,
    "subject": subject,
    "publisher": publisher?.toJson(),
    //"user": user.toJson(),
  };
}