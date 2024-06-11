import 'dart:convert';

import 'package:bn_academy_school/pages/forgot_password/verification_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class RegistrationController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> registerWithEmail() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/register");
      Map body = {
        'name': nameController.text,
        'email': emailController.text.trim(),
        'password': passwordController.text,
        'role': "ADMIN",
      };

      http.Response response = await http.post(
        url,
        body: json.encode(body),
        headers: headers,
      );

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final SharedPreferences prefs = await _prefs;
        await prefs.setString('name', body['name']);
        await prefs.setString('fullName', body['name']);
        await prefs.setString('email', body['email']);
        await prefs.setBool('isLoggedIn', true);

        Get.to(() => VerificationPage(email: emailController.text.trim()));

        nameController.clear();
        emailController.clear();
        passwordController.clear();
        confirmPasswordController.clear();
      } else {
        Get.snackbar(
          "Registration Failed",
          "Error: ${response.body}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
