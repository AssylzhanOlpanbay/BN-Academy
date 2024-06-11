import 'dart:convert';

import 'package:bn_academy_school/core/navigation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> loginWithEmail() async {
    try {
      var headers = {
        'Content-Type': 'application/json',
      };
      var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/authenticate");
      Map<String, String> body = {
        'email': emailController.text.trim(),
        'password': passwordController.text,
      };

      http.Response response = await http.post(
        url,
        body: json.encode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('token', jsonResponse['access_token'] ?? '');
        await prefs.setString('name', jsonResponse['name'] ?? '');
        await prefs.setString('email', emailController.text.trim());
        await prefs.setBool('isLoggedIn', true); 
        Get.offAll(() => NavigationPage());

        emailController.clear();
        passwordController.clear();
      } else if (response.statusCode == 401) {
        Get.snackbar(
          "Ошибка входа",
          "Неверный адрес электронной почты или пароль",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else if (response.statusCode == 403) {
        String errorMsg = "Доступ запрещен";
        try {
          final errorResponse = jsonDecode(response.body);
          errorMsg = errorResponse['message'] ?? errorMsg;
        } catch (e) {
          errorMsg = response.body.isNotEmpty ? response.body : errorMsg;
        }
        Get.snackbar(
          "Ошибка входа",
          "Доступ запрещен: $errorMsg",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Ошибка входа",
          "Ошибка при входе: ${response.statusCode}. ${response.body}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Ошибка входа",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}