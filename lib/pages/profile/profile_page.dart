import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/profile/faq/faq_page.dart';
import 'package:bn_academy_school/pages/profile/help/help_page.dart';
import 'package:bn_academy_school/pages/profile/log_out_button.dart';
import 'package:bn_academy_school/pages/profile/profile_page_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 70,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("Ерден Алиев", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),),
            SizedBox(height: screenHeight * 0.005),
            Text("Студент", style: TextStyle(fontSize: screenWidth * 0.045, color: AppColor.profilePageTextColor),),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: double.infinity,
              height: screenHeight * 0.4,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Container(
                margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.02, right: screenWidth * 0.02),
                child: Column(
                  children: [
                    ProfilePageButton(
                      width: double.infinity, 
                      height: screenHeight * 0.075, 
                      icon: Icons.person_2_outlined, 
                      text: "Мой аккаунт", 
                      press: () {},
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ProfilePageButton(
                      width: double.infinity, 
                      height: screenHeight * 0.075, 
                      icon: Icons.lock_outline_rounded, 
                      text: "Сброс пароля", 
                      press: () {},
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ProfilePageButton(
                      width: double.infinity, 
                      height: screenHeight * 0.075, 
                      icon: Icons.question_mark_outlined, 
                      text: "FAQ", 
                      press: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FAQPage()));
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),
                    ProfilePageButton(
                      width: double.infinity, 
                      height: screenHeight * 0.075, 
                      icon: Icons.chat_outlined, 
                      text: "Группа поддержки", 
                      press: () {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HelpPage()));
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            LogOutButton(
              color: AppColor.redColor, 
              width: double.infinity, 
              height: screenHeight * 0.06, 
              text: "Выйти", 
              press: () {}, 
              textWidth: screenWidth * 0.045, 
              textColor: AppColor.whiteColor
            )
          ],
        ),
      ),
    );
  }
}