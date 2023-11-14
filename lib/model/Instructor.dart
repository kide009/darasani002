class Instructor {
   String id;
   DateTime createdAt;
   DateTime updatedAt;
    String instructorId;
   String courseId;

   Instructor({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    required this.instructorId,
    required this.courseId,
  });


  factory Instructor.fromJson(Map<String, dynamic> json) => Instructor(
    id: json["id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["createdAt"]),
    instructorId: json["instructorId"], courseId: json["courseId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    'instructorId': instructorId,
    'courseId': courseId,    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}