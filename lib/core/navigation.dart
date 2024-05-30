import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/core/bottom_navigation.dart';
import 'package:bn_academy_school/pages/lessons/lessons_page.dart';
import 'package:bn_academy_school/pages/main/main_page.dart';
import 'package:bn_academy_school/pages/news/news_page.dart';
import 'package:bn_academy_school/pages/profile/profile_page.dart';
import 'package:bn_academy_school/pages/progress/progress_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key});

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {
  late List<Widget> pages = [];
  String name = '';
  String email = '';

  @override
  void initState() {
    super.initState();
    _loadUserInfo().then((_) {
      setState(() {
        pages = [
          MainPage(),
          NewsPage(),
          LessonsPage(),
          ProgressPage(),
          ProfilePage(),
        ];
      });
    });
  }

  Future<void> _loadUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString('name') ?? '';
    email = prefs.getString('email') ?? '';
  }

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (pages.isEmpty) {
      return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
