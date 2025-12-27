import 'package:expense_tracker/Core/Network/api_endpoints.dart';
import 'package:expense_tracker/Core/Network/api_service.dart';
import 'package:expense_tracker/Data/Models/User_Model.dart';
import 'package:http/http.dart';

class UserRepo{

  final Api_Service _api_service = Api_Service();

  Future<UserModel?> getMyProfile() async {
    final Response = await _api_service.getRequest(ApiConstants.View_User);

    if ((Response as List).isNotEmpty) {
      return UserModel.fromJson(Response.first);
    }
    return null;
  }
}