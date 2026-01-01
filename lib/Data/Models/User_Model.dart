class UserModel {
  final String user_id;
  final String name;
  final String surname;
  final String email;
  final String phone;
  final String DOB;
  final String profile_image;
  final String role; // admin / user
  final String? created_at;
  final String? updated_at;

  UserModel({
    required this.user_id,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.DOB,
    required this.profile_image,
    required this.role,
    this.created_at,
    this.updated_at,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      user_id: json['user_id']?.toString() ?? '',
      name: json['name'] ?? '',
      surname: json['surname'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      DOB: json['DOB'] ?? '',
      profile_image: json['profile_image'] ?? '',
      role: json['role'] ?? 'user',
      created_at: json['created_at'],
      updated_at: json['updated_at'],
    );
  }
}
