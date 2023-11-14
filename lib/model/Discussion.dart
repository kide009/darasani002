// To parse this JSON data, do
//
//     final discussion = discussionFromJson(jsonString);

import 'dart:convert';

Discussion discussionFromJson(String str) => Discussion.fromJson(json.decode(str));

String discussionToJson(Discussion data) => json.encode(data.toJson());

class Discussion {
  int id;
  int userId;
  String category;
  String title;
  String content;
  String slug;
  DateTime createdAt;
  DateTime updatedAt;

  Discussion({
    required this.id,
    required this.userId,
    required this.category,
    required this.title,
    required this.content,
    required this.slug,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Discussion.fromJson(Map<String, dynamic> json) => Discussion(
    id: json["id"],
    userId: json["user_id"],
    category: json["category"],
    title: json["title"],
    content: json["content"],
    slug: json["slug"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "category": category,
    "title": title,
    "content": content,
    "slug": slug,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
