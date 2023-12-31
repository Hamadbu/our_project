import 'package:flutter/material.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:meditation_app/models/users.dart';
import 'package:meditation_app/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final authService = AuthService();
  String token = "";

  Future<String> signup({required User user}) async {
    token = await authService.signup(user: user);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  Future<String> getUsernameFromToken() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    String username = decodedToken['username'];

    return username;
  }

  Future<String> signin({required User user}) async {
    token = await authService.signin(user: user);
    saveTokenInStorage(token);

    /// token to be saved in local storage
    notifyListeners();
    return token;
  }

  // saveTokenInStorage
  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  //readTokenFromStorage

  Future<String> readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    /// ??  null check operator
    notifyListeners();
    return token;
  }

  Future<void> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString("token", '');
    token = "";
    //print(token);
    saveTokenInStorage(token);
    notifyListeners();
  }
}
