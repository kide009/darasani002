class Class {
   String id;
   DateTime createdAt;
   DateTime updatedAt;
   String classId;
   String courseId;

  Class({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.classId,
    required this.courseId,
  });


  factory Class.fromJson(Map<String, dynamic> json) => Class(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["createdAt"]),
    classId: json["classId"], courseId: json["courseId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    'classId': classId,
    'courseId': courseId,    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}