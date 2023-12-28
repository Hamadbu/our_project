import 'package:dio/dio.dart';
import 'package:meditation_app/models/token.dart';
import 'package:meditation_app/models/users.dart';
import 'package:meditation_app/services/client.dart';

class AuthService {
  Future<String> signup({required User user}) async {
    try {
      if (user.username.isNotEmpty && user.password.isNotEmpty) {
        final FormData formData =
            FormData.fromMap(user.toJson() as Map<String, dynamic>);
        final Response response =
            await ApiClient.post("/signup", formData: formData);
        print(response.data);
        Token tokenModle = Token.fromJson(response.data);
        return tokenModle.token.toString();
      }
      return "";
    } catch (e) {
      throw e.toString();
    }
  }

  Future signin({required User user}) async {
    try {
      final FormData formData =
          FormData.fromMap(user.toJson() as Map<String, dynamic>);
      final Response response =
          await ApiClient.post("/signin", formData: formData);
      Token tokenModel = Token.fromJson(response.data);
      return tokenModel.token;
    } catch (e) {
      throw e.toString();
    }
  }
}
