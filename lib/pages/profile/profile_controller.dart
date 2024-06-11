import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var profileImagePath = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  Future<void> loadUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name.value = prefs.getString('fullName') ?? '';
    email.value = prefs.getString('email') ?? '';
    profileImagePath.value = prefs.getString('profileImagePath') ?? '';
  }

  Future<void> saveUserInfo(String newName, String newEmail, String? newProfileImagePath) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fullName', newName);
    await prefs.setString('email', newEmail);
    if (newProfileImagePath != null) {
      await prefs.setString('profileImagePath', newProfileImagePath);
      profileImagePath.value = newProfileImagePath;
    }
    name.value = newName;
    email.value = newEmail;
  }
}
