import 'dart:io';

import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/main/big_card.dart';
import 'package:bn_academy_school/pages/main/medium_card.dart';
import 'package:bn_academy_school/pages/main/mini_card.dart';
import 'package:bn_academy_school/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ProfileController profileController = Get.put(ProfileController());

  Future<Map<String, String>> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedName = prefs.getString('name') ?? '';
    String savedEmail = prefs.getString('email') ?? '';
    String profileImagePath = prefs.getString('profileImagePath') ?? '';
    return {'name': savedName, 'email': savedEmail, 'profileImagePath': profileImagePath};
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<Map<String, String>>(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          String savedName = snapshot.data?['name'] ?? '';
          String savedEmail = snapshot.data?['email'] ?? '';
          String profileImagePath = snapshot.data?['profileImagePath'] ?? '';
        return Scaffold(
        backgroundColor: AppColor.backgroundColor,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    CircleAvatar(
                            backgroundImage: profileController.profileImagePath.value.isNotEmpty
                                ? FileImage(File(profileController.profileImagePath.value))
                                : null,
                            child: profileController.profileImagePath.value.isEmpty
                                ? Icon(Icons.person, size: 30)
                                : null,
                          ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "BN ACADEMY SCHOOL", 
                  style: TextStyle(
                    fontSize: screenWidth * 0.1, 
                    fontWeight: FontWeight.w500, 
                    fontFamily: "Koulen", 
                    color: AppColor.mainColor,
                    shadows: const [ 
                      Shadow(
                        color: AppColor.mainColor,
                        blurRadius: 5,
                        offset: Offset(1, 1),
                      )
                    ]
                  ),
                ),
                SizedBox(height: screenHeight * 0.03),
                const MiniCard(
                  imageUrl: 'assets/images/earth_icon.png', 
                  title: '2015', 
                  subtile: 'год, когда мы встали на путь образования',
                ),
                const MiniCard(
                  imageUrl: 'assets/images/school_icon.png', 
                  title: '98%', 
                  subtile: 'учеников-обладатели грантов',
                ),
                const MiniCard(
                  imageUrl: 'assets/images/people_icon.png', 
                  title: '10К+', 
                  subtile: 'выпускников',
                ),
                SizedBox(height: screenHeight * 0.03),
                const MediumCard(),
                SizedBox(height: screenHeight * 0.02),
                BigCard(),
              ],
            ),
          ),
        ),
      );
        }
      }
    );
  }
}