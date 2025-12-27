import 'package:flutter/material.dart';
import 'package:expense_tracker/Data/Models/User_Model.dart';
import 'package:expense_tracker/Data/Repositories/User/User_Repositorie.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepo _repository = UserRepo();

  UserModel? user;
  bool isLoading = false;
  String error = '';

  Future<void> loadProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      final json = await _repository.getMyProfile();
      if (json != null) {
        user = UserModel.fromJson(json as Map<String, dynamic>);
      }
      error = '';
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
