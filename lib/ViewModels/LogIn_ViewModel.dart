import 'package:expense_tracker/Data/Repositories/LogIn_Repositorie.dart';
import 'package:flutter/material.dart';
import '../Data/Models/Login_Model.dart';

class LoginViewModel extends ChangeNotifier {
  final LogInRepo _authRepo = LogInRepo();
  bool isLoading = false;


  Future<void> login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading = true;
    notifyListeners();

    try {
      final LoginModel = await _authRepo.login(
        email: email,
        password: password,
      );

      if (LoginModel.status && LoginModel.user != null) {
        if (LoginModel.user!.role == 'admin') {
          Navigator.pushReplacementNamed(context, '/adminDashboard');
        } else {
          Navigator.pushReplacementNamed(context, '/userDashboard');
        }
      } else {
        _showError(context, LoginModel.message);
      }
    } catch (e) {
      _showError(context, e.toString());
    }

    isLoading = false;
    notifyListeners();
  }

  void _showError(BuildContext context, String msg) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(msg)));
  }
}
