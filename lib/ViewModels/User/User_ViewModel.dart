import 'package:expense_tracker/Data/Repositories/User/User_Repositorie.dart';
import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';

class UserViewModel extends ChangeNotifier {
  final UserRepo _repository = UserRepo();

  UserModel? user;
  bool isLoading = false;
  String error = '';

  Future<void> loadProfile() async {
    isLoading = true;
    notifyListeners();

    try {
      user = (await _repository.getMyProfile()) as UserModel?;
      error = '';
    } catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
