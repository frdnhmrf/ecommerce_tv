import 'dart:convert';

import 'package:ecommerce_tv/data/model/responses/auth_response_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthLocalDatasource {
  Future<bool> saveAuth(AuthResponseModel model) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final result = await prefs.setString('auth', jsonEncode(model.toJson()));
    return result;
  }

  Future<bool> removeAuthData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove('auth');
  }

  Future<String> getToken() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth') ?? '';
    final authData = AuthResponseModel.fromJson(jsonDecode(authJson));
    return authData.jwt;
  }

  Future<bool> isLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final authJson = prefs.getString('auth');
    return authJson != null;
  }
}
