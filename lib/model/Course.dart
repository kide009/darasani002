import 'dart:convert';
import 'package:intl/intl.dart';

import 'Class.dart';
import 'Instructor.dart';
import 'Lesson.dart';
import 'Publisher.dart';

Course courseFromJson(String str) => Course.fromJson(json.decode(str));

String courseToJson(Course data) => json.encode(data.toJson());
class Course {
  String id;
  String? teacherId;
  String? categoryId;
  String? subjectId;
  String title;
  String subject;
  String coverImg;
  String description;
  int price;
  String? status;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime startTime;
  DateTime endTime;
  DateTime startDate;
  DateTime endDate;
  bool isApproved;
   List<Class> classes;
   List<Lesson> lessons;
   List<Instructor> instructors;
   List<dynamic> enrollments;

  Course({
    required this.id,
    required this.teacherId,
    required this.categoryId,
    required this.subjectId,
    required this.title,
    required this.coverImg,
    required this.description,
    required this.price,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.startTime,
    required this.endTime,
    required this.startDate,
    required this.endDate,
    required this.subject,
    required this.isApproved,
    required this.classes,
    required this.lessons,
    required this.instructors,
    required this.enrollments,

  });

  factory Course.fromJson(Map<String, dynamic> json) => Course(

    id: json["id"],
    teacherId: json["teacher_id"],
    categoryId: json["category_id"],
    subjectId: json["subject_id"],
    title: json["title"],
    coverImg: json["coverImg"],
    description: json["description"],
    price: json["price"],
    status: json["status"],
    subject: json["subject"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    startTime: parseCustomTime(json["startTime"]),
    endTime: parseCustomTime(json["endTime"]),
    startDate: DateFormat('MM-dd-yyyy').parse(json["startDate"]),
    endDate: DateFormat('MM-dd-yyyy').parse(json["endDate"]),
    isApproved: json["isApproved"],
    classes: (json['class'] as List)
        .map((classJson) => Class.fromJson(classJson))
        .toList(),
    lessons: (json['lessons'] as List)
        .map((lessonJson) => Lesson.fromJson(lessonJson))
        .toList(),
    instructors: (json['instructors'] as List)
        .map((instructorJson) => Instructor.fromJson(instructorJson))
        .toList(),
    enrollments: json['enrollments'],

  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "teacher_id": teacherId,
    "category_id": categoryId,
    "subject_id": subjectId,
    "title": title,
    "coverImg": coverImg,
    "description": description,
    "price": price,
    "subject":subject,
    "status": status,
    "createdAt": createdAt.toIso8601String(),
    "updatedAt": updatedAt.toIso8601String(),
    "startTime": startTime.toIso8601String(),
    "endTime": endTime.toIso8601String(),
    "isApproved": isApproved,
    "startDate": startDate.toIso8601String(),
    "endDate": endDate.toIso8601String(),
    'class': classes.map((c) => c.toJson()).toList(),
    'lessons': lessons.map((l) => l.toJson()).toList(),
    'instructors': instructors.map((i) => i.toJson()).toList(),
    'enrollments': enrollments,

  };

 static DateTime parseCustomTime(String timeString) {
   final DateFormat format = DateFormat('hh:mm a');
   final DateTime parsedTime = DateFormat.jm().parse(timeString.toUpperCase(), true);

   return parsedTime;
 }
}
