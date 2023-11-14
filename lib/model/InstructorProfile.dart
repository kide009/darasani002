import 'dart:convert';
import 'package:darasani/model/Cartegory.dart';
import 'package:darasani/model/User.dart';

InstructorProfile instructorProfileFromJson(String str) => InstructorProfile.fromJson(json.decode(str));

String instructorProfileToJson(InstructorProfile data) => json.encode(data.toJson());

class InstructorProfile {
   String id;
   DateTime createdAt;
   DateTime updatedAt;
   String bio;
   String experience;
   String cost;
   String teachesClasses;
   String teachesSubjects;
   String userId;

  InstructorProfile({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.bio,
    required this.experience,
    required this.cost,
    required this.teachesClasses,
    required this.teachesSubjects,
    required this.userId,
  });

  factory InstructorProfile.fromJson(Map<String, dynamic> json) => InstructorProfile(
    id: json['id'],
    createdAt: DateTime.parse(json['createdAt']),
    updatedAt: DateTime.parse(json['updatedAt']),
    bio: json['bio'],
    experience: json['experience'],
    cost: json['cost'],
    teachesClasses: json['teachesClasses'],
    teachesSubjects: json['teachesSubjects'],
    userId: json['userId'],
  );

   Map<String, dynamic> toJson() => {
     "id": id,
     "createdAt": createdAt.toIso8601String(),
     "updatedAt": updatedAt.toIso8601String(),
     "bio": bio,
     "experience": experience,
     "cost": cost,
     "teachesClasses": teachesClasses,
     "teachesSubjects": teachesSubjects,
     "userId": userId,
   };

}