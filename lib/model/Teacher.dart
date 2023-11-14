import 'package:darasani/model/Course.dart';
import 'dart:convert';

import 'InstructorProfile.dart';

Teacher teacherFromJson(String str) => Teacher.fromJson(json.decode(str));

String teacherToJson(Teacher data) => json.encode(data.toJson());
class Teacher {
  String id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String role;
  String nida;
  String certificate;
  String? profileImg;
  DateTime createdAt;
  DateTime updatedAt;
  String phoneNumber;
  InstructorProfile? instructorProfile;

  Teacher({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    required this.nida,
    required this.certificate,
    required this.profileImg,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,

   required this.instructorProfile,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    role: json["role"],
    nida: json?["nida"]??'null',
    certificate: json?["certificate"] ?? 'null',
    profileImg: json["profileImg"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    phoneNumber: json?["phoneNumber"] ?? 'null',
    instructorProfile: InstructorProfile.fromJson(json['instructorProfile']),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "role": role,
    "nida": nida,
    "certificate": certificate,
    "profileImg": profileImg,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "phone_number": phoneNumber,
    "course": instructorProfile?.toJson(),
  };
}