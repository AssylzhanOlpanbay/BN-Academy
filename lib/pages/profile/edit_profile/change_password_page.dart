import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)),
                  Text("Сменить пароль", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: screenHeight * 0.2),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.textFormFieldBorderColor)
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      hintText: "Новый пароль",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.textFormFieldFilledBorderColor)
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.textFormFieldBorderColor)
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      hintText: "Подтвердите пароль",
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.textFormFieldFilledBorderColor)
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Button(
                color: AppColor.mainColor, 
                width: double.infinity, 
                height: screenHeight * 0.06, 
                text: "Сменить пароль", 
                press: () {}, 
                textWidth: screenWidth * 0.04, 
                textColor: AppColor.whiteColor
              )
            ],
          ),
        ),
      ),
    );
  }
}