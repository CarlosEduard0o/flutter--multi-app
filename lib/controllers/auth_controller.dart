import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:multi_app/shared/app_constants.dart';

class AuthController {
  static final AuthController instance = AuthController();

  Future<bool> login(String username, String password) async {
    http.Response response = await http.post(
      Uri.parse('${AppConstants.baseAuthApiUrl}auth/login'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,
        'expiresInMins': 30,
      }),
    );
    print(response.body);
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
