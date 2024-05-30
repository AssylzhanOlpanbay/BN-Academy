import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/core/navigation.dart';
import 'package:bn_academy_school/pages/main/main_page.dart';
import 'package:bn_academy_school/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => SharedPreferences.getInstance());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColor.whiteColor,
      home: FutureBuilder<bool>(
        future: checkIfLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            if (snapshot.data == true) {
              return NavigationPage();
            } else {
              return WelcomePage();
            }
          }
        },
      ),
    );
  }

  Future<bool> checkIfLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey('token');
  }
}