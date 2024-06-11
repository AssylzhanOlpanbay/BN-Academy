import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final Function(int index) onTap;
  final int currentIndex;
  final List pageNames = [
    'Главная',
    'Новости',
    'Мои уроки',
    'Прогресс',
    'Профиль'
  ];

  CustomBottomNavigationBar({
    required this.onTap,
    required this.currentIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
      child: BottomNavigationBar(
        onTap: onTap,
        backgroundColor: AppColor.whiteColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        unselectedFontSize: screenWidth * 0.03,
        unselectedItemColor: AppColor.newsButtonSubtitleTextColor,
        selectedItemColor: AppColor.mainColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 14,
        selectedLabelStyle: const TextStyle(color: AppColor.mainColor),
        unselectedLabelStyle: TextStyle(color: AppColor.mainColor),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            label: pageNames[0],
            icon: SizedBox(
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
              child: ImageIcon(
                AssetImage('assets/images/home.png'),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: pageNames[1],
            icon: SizedBox(
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
              child: ImageIcon(
                AssetImage('assets/images/news.png'),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: pageNames[2],
            icon: SizedBox(
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
              child: ImageIcon(
                AssetImage('assets/images/lessons.png'),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: pageNames[3],
            icon: SizedBox(
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
              child: ImageIcon(
                AssetImage('assets/images/progress.png'),
              ),
            ),
          ),
          BottomNavigationBarItem(
            label: pageNames[4],
            icon: SizedBox(
              width: screenWidth * 0.05,
              height: screenHeight * 0.05,
              child: ImageIcon(
                AssetImage('assets/images/profile.png'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
