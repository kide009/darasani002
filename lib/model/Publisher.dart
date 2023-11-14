import 'dart:convert';
import 'package:darasani/model/Cartegory.dart';
import 'package:darasani/model/User.dart';

Publisher publisherFromJson(String str) => Publisher.fromJson(json.decode(str));

String publisherToJson(Publisher data) => json.encode(data.toJson());

class Publisher {
  String id;
  String name;


  Publisher({
    required this.id,
    required this.name,

  });

  factory Publisher.fromJson(Map<String, dynamic> json) => Publisher(
    id: json["id"],
    name: json["name"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,

  };
}