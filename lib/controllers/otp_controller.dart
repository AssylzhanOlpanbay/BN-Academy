import 'dart:convert';
import 'package:bn_academy_school/pages/login/login_page.dart';
import 'package:bn_academy_school/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';


// class OtpController extends GetxController {
//   TextEditingController firstController = TextEditingController();
//   TextEditingController secondController = TextEditingController();
//   TextEditingController thirdController = TextEditingController();
//   TextEditingController fourthController = TextEditingController();

//   final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
//   final SharedPreferences prefs = Get.find();

//   Future<void> verifyOtp() async {
//     try {
//       var headers = {'Content-Type': 'application/json'};
//       var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/otp");
//       String otp = "${firstController.text}${secondController.text}${thirdController.text}${fourthController.text}";
//       String? email = prefs.getString('email');

//       if (email == null) {
//         throw Exception("Email not found in SharedPreferences");
//       }

//       if (otp.length != 4) {
//         throw Exception("Please enter a valid 4-digit OTP");
//       }

//       Map<String, String> body = {
//         'email': email,
//         'otp': otp,
//       };

//       http.Response response = await http.post(
//         url,
//         body: json.encode(body),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         final jsonResponse = jsonDecode(response.body);
//         await prefs.setString('token', jsonResponse['access_token']); // Сохранение токена
//         await prefs.setBool('isLoggedIn', true); // Сохранение состояния входа

//         Get.offAll(() => MainPage());

//         firstController.clear();
//         secondController.clear();
//         thirdController.clear();
//         fourthController.clear();
//       } else {
//         Get.snackbar(
//           "OTP Failed",
//           "Error: ${response.body}",
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         "Exception occurred: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }

//   Future<void> resendOtp() async {
//     try {
//       var headers = {'Content-Type': 'application/json'};
//       var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/otp"); 
//       String? email = prefs.getString('email');

//       if (email == null) {
//         throw Exception("Email not found in SharedPreferences");
//       }

//       Map<String, String> body = {
//         'email': email,
//       };

//       http.Response response = await http.post(
//         url,
//         body: json.encode(body),
//         headers: headers,
//       );

//       if (response.statusCode == 200) {
//         Get.snackbar(
//           "OTP Sent",
//           "A new OTP has been sent to your email.",
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       } else {
//         Get.snackbar(
//           "Resend OTP Failed",
//           "Error: ${response.body}",
//           snackPosition: SnackPosition.BOTTOM,
//         );
//       }
//     } catch (e) {
//       Get.snackbar(
//         "Error",
//         "Exception occurred: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     }
//   }




class OtpController extends GetxController {
  TextEditingController firstController = TextEditingController();
  TextEditingController secondController = TextEditingController();
  TextEditingController thirdController = TextEditingController();
  TextEditingController fourthController = TextEditingController();

  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  final SharedPreferences prefs = Get.find();

  Future<void> verifyOtp() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/otp");
      String otp = "${firstController.text}${secondController.text}${thirdController.text}${fourthController.text}";
      String? email = prefs.getString('email');

      if (email == null) {
        throw Exception("Email not found in SharedPreferences");
      }

      if (otp.length != 4) {
        throw Exception("Please enter a valid 4-digit OTP");
      }

      Map<String, String> body = {
        'email': email,
        'otp': otp,
      };

      print('Sending OTP verification request: $body');

      http.Response response = await http.post(
        url,
        body: json.encode(body),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final json = jsonDecode(response.body);
        final SharedPreferences prefs = await _prefs;
        
        Get.offAll(() => const LoginPage());

        firstController.clear();
        secondController.clear();
        thirdController.clear();
        fourthController.clear();
      } else {
        Get.snackbar(
          "OTP Failed",
          "Error: ${response.body}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar(
        "Error",
        "Exception occurred: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> resendOtp() async {
    try {
      var headers = {'Content-Type': 'application/json'};
      var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/otp"); 
      String? email = prefs.getString('email');

      if (email == null) {
        throw Exception("Email not found in SharedPreferences");
      }

      Map<String, String> body = {
        'email': email,
      };

      print('Sending OTP resend request: $body');

      http.Response response = await http.post(
        url,
        body: json.encode(body),
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        Get.snackbar(
          "OTP Sent",
          "A new OTP has been sent to your email.",
          snackPosition: SnackPosition.BOTTOM,
        );
      } else {
        Get.snackbar(
          "Resend OTP Failed",
          "Error: ${response.body}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar(
        "Error",
        "Exception occurred: $e",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}
