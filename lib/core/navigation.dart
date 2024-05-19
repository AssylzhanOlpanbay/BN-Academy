import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/core/bottom_navigation.dart';
import 'package:bn_academy_school/pages/lessons/lessons_page.dart';
import 'package:bn_academy_school/pages/main/main_page.dart';
import 'package:bn_academy_school/pages/news/news_page.dart';
import 'package:bn_academy_school/pages/profile/profile_page.dart';
import 'package:bn_academy_school/pages/progress/progress_page.dart';
import 'package:flutter/material.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late final List<Widget> pages;

  @override
  void initState() {
    pages = [
      MainPage(),
      NewsPage(),
      LessonsPage(),
      ProgressPage(),
      ProfilePage()
    ];
    super.initState();
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColor.backgroundColor,
      body: IndexedStack(
        index: currentIndex,
        children: pages,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        onTap: onTap,
        currentIndex: currentIndex,
      ),
    );
  }
}