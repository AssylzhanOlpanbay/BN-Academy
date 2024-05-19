import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class SuccessPage extends StatelessWidget {
  final userNewPassword = TextEditingController();
  final userConfirmNewPassword = TextEditingController();

  bool isVisible = false;

  SuccessPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      body: Center(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset("assets/images/check-circle.png", width: screenWidth * 0.3),
                SizedBox(height: screenHeight * 0.05),
                Text("Пароль был изменен", textAlign: TextAlign.center, style: TextStyle(height: 1.2, fontSize: screenWidth * 0.075, fontFamily: "TTNormsPro", fontWeight: FontWeight.w600, color: AppColor.blackColor),),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Ваш пароль был успешно изменен",
                  style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: const Color.fromRGBO(131, 139, 161, 1)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                Button(
                  color: AppColor.mainColor, 
                  width: double.infinity, 
                  height: screenHeight * 0.07, 
                  text: "Войти", 
                  press: () {}, 
                  textWidth: screenWidth * 0.05, 
                  textColor: AppColor.whiteColor,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}