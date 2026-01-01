import 'package:expense_tracker/Data/Models/User_Model.dart';

class LoginModel {

  final String message;
  final bool status;
  final UserModel? user;

  LoginModel({

    required this.message,
    required this.status,
    this.user
 });

  factory LoginModel.fromJson(Map<String, dynamic> json) {
    return LoginModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      user: json['user'] != null ? UserModel.fromJson(json['user']) : null,
    );
  }
}


