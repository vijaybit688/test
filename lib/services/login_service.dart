import 'dart:convert';

import 'package:flutter/cupertino.dart';

import '../model/loginModel.dart';
import 'package:http/http.dart' as http;

import '../utils/show_toast.dart';

class LoginServices {
  static Future<LoginModel> login(
      {required String api,
      required String email,
      required String password,
      required BuildContext context}) async {
    var response = await http
        .post(Uri.parse(api), body: {"email": email, "password": password});
    print(response.statusCode);

    if (response.statusCode == 200) {
      print(jsonDecode(response.body));
      LoginModel jsonResponse = LoginModel.fromJson(jsonDecode(response.body));
      return jsonResponse;
    } else {
      final errorMessage = jsonDecode(response.body);
      print(errorMessage['error']);
      Alert.createToastByPassingMessage(message: errorMessage['error']);
    }
    throw {Alert.createToastByPassingMessage(message: "Something Went Worng")};
  }
}
