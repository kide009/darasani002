class User {
  int id;
  String name;
  String email;
  dynamic emailVerifiedAt;
  String role;
  dynamic nida;
  dynamic certificate;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  String phoneNumber;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.emailVerifiedAt,
    required this.role,
    this.nida,
    this.certificate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    role: json["role"],
    nida: json["nida"],
    certificate: json["certificate"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    phoneNumber: json?["phone_number"] ?? 'null',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "role": role,
    "nida": nida,
    "certificate": certificate,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "phone_number": phoneNumber,
  };
}