import 'package:flutter/material.dart';
import '../../Data/Models/User_Model.dart';
import '../../Data/Repositories/Admin/Admin_User_Repositorie.dart';


class AdminUserViewModel extends ChangeNotifier {
  final AdminUserRepo _repository = AdminUserRepo();

  List<UserModel> users = [];
  bool isLoading = false;
  String error = '';

  Future<void> loadUsers() async {
    isLoading = true;
    notifyListeners();

    try {
      users = await _repository.getAllUsers();
      error = '';
    }

    catch (e) {
      error = e.toString();
    }

    isLoading = false;
    notifyListeners();
  }
}
