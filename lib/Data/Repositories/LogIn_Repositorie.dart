import 'package:expense_tracker/Core/Network/api_service.dart';
import 'package:expense_tracker/Data/Models/LogIn_Model.dart';


class LogInRepo {

  Future<LoginModel> login({
    required String email,
    required String password,
  }) async {

    final response = await Api_Service.login(
      email: email,
      password: password,
    );
    return LoginModel.fromJson(response);
  }
}


