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
        unselectedItemColor: AppColor.mainColor.withOpacity(0.5),
        selectedItemColor: AppColor.mainColor,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedFontSize: 14,
        selectedLabelStyle:
            const TextStyle(color: AppColor.mainColor),
        unselectedLabelStyle: TextStyle(color: AppColor.mainColor),
        elevation: 0,
        items: [
          BottomNavigationBarItem(
              label: pageNames[0], icon: const Icon(Icons.home)),
          BottomNavigationBarItem(
              label: pageNames[1], icon: const Icon(Icons.newspaper_rounded)),
          BottomNavigationBarItem(
              label: pageNames[2],
              icon: const Icon(Icons.folder_copy_rounded)),
          BottomNavigationBarItem(
              label: pageNames[3], icon: const Icon(Icons.stairs_outlined)),
          BottomNavigationBarItem(
              label: pageNames[4], icon: const Icon(Icons.person_2_outlined)),
        ],
      ),
    );
  }
}