import 'dart:convert';

Lesson lessonFromJson(String str) => Lesson.fromJson(json.decode(str));

String lessonToJson(Lesson data) => json.encode(data.toJson());

class Lesson {
   String id;
   DateTime createdAt;
   DateTime updatedAt;
   String courseId;
    String title;
    String description;
    int duration;

   Lesson({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.courseId,
     required this.title,
     required this.description,
     required this.duration,
  });


  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["id"],
    title: json["title"],
    duration: json["duration"],
    description: json["description"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["createdAt"]),
    courseId: json["courseId"],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    'title': title,
    'description': description,
    'duration': duration,
    'courseId': courseId,    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}