import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/login/login_page.dart';
import 'package:bn_academy_school/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';

class LoginAndSignUpPage extends StatelessWidget {
  const LoginAndSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(child: Image.asset("assets/images/bn_academy_school_logo.png", width: screenWidth * 0.7,)),
            SizedBox(height: screenHeight * 0.05),
            Text(
              "Добро пожаловать \nв BN Academy!", 
              style: TextStyle(
                fontSize: screenWidth * 0.08, 
                fontWeight: FontWeight.bold, 
                fontFamily: "TTNormsPro",
                color: AppColor.blackColor
              ), 
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.02),
            Text(
              "Войдите чтобы продолжить работу \nна платформе", 
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontFamily: "TTNormsPro",
                color: AppColor.blackColor
              ), 
              textAlign: TextAlign.center,
            ),
            SizedBox(height: screenHeight * 0.07),
            Button(
              color: AppColor.mainColor, 
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "Войти", 
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
              }, 
              textWidth: screenWidth * 0.05, 
              textColor: AppColor.whiteColor,
            ),
            SizedBox(height: screenHeight * 0.02),
            Button(
              color: AppColor.whiteColor, 
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "Регистрация", 
              press: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
              }, 
              textWidth: screenWidth * 0.05, 
              textColor: AppColor.mainColor,
            ),
          ],
        ),
      ),
    );
  }
}