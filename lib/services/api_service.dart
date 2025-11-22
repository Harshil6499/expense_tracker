import 'dart:convert';
import 'package:http/http.dart' as http;
import 'api_endpoints.dart';

// class ApiService{
//
//   // Users
//   Future<List<User>> fetchUsers() async {
//     final res = await http.get(Uri.parse(ApiConstants.View_User));
//     if (res.statusCode == 200) {
//       final list = json.decode(res.body) as List;
//       return list.map((e) => User.fromJson(e)).toList();
//     }
//     throw Exception('Failed to load users');
//   }
// }