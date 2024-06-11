import 'package:bn_academy_school/pages/login/login_page.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/response/response.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogoutController extends GetxController {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> logout() async {
    try {
      final SharedPreferences prefs = await _prefs;
      String? token = prefs.getString('token');

      if (token == null) {
        Get.snackbar(
          "Ошибка",
          "Токен не найден",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }

      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      };
      var url = Uri.parse("http://10.0.2.2:8080/api/v1/auth/logout");

      print('Sending request to $url');
      print('Request headers: $headers');

      http.Response response = await http.post(
        url,
        headers: headers,
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        await prefs.clear();

        Get.offAll(() => LoginPage());
      } else {
        Get.snackbar(
          "Ошибка выхода",
          "Ошибка: ${response.body}",
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } catch (e) {
      print('Exception: $e');
      Get.snackbar(
        "Ошибка",
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
}