import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/core/bottom_navigation.dart';
import 'package:bn_academy_school/core/navigation.dart';
import 'package:bn_academy_school/pages/forgot_password/create_new_password_page.dart';
import 'package:bn_academy_school/pages/forgot_password/forgot_password_page.dart';
import 'package:bn_academy_school/pages/forgot_password/success_page.dart';
import 'package:bn_academy_school/pages/forgot_password/verification_page.dart';
import 'package:bn_academy_school/pages/lessons/lessons_page.dart';
import 'package:bn_academy_school/pages/login/login_page.dart';
import 'package:bn_academy_school/pages/login_and_signup/login_and_signup_page.dart';
import 'package:bn_academy_school/pages/main/main_page.dart';
import 'package:bn_academy_school/pages/profile/profile_page.dart';
import 'package:bn_academy_school/pages/progress/progress_page.dart';
import 'package:bn_academy_school/pages/sign_up/sign_up_page.dart';
import 'package:bn_academy_school/pages/subjects/subjects_page.dart';
import 'package:bn_academy_school/pages/video_lesson/video_lesson_page.dart';
import 'package:bn_academy_school/pages/video_lesson/video_player_section.dart';
import 'package:bn_academy_school/pages/welcome/welcome_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      color: AppColor.whiteColor,
      home: NavigationPage(),
    );
  }
}