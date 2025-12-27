import 'package:expense_tracker/Core/Network/api_endpoints.dart';
import 'package:expense_tracker/Core/Network/api_service.dart';
import 'package:expense_tracker/Data/Models/User_Model.dart';
import 'package:http/http.dart';

class AdminUserRepo {

  final Api_Service _api_service = Api_Service();

  Future<List<UserModel>> getAllUsers() async {
    final Response = await _api_service.getRequest(ApiConstants.View_User);

    return (Response as List)
        .map((e) => UserModel.fromJson(e))
        .toList();
  }
}