import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

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
                  Text("Мой аккаунт", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),)
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 70,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: screenHeight * 0.045,
                      height: screenHeight * 0.045,
                      decoration: BoxDecoration(
                        color: AppColor.editPhotoIconButtonColor,
                        borderRadius: BorderRadius.circular(50)
                      ),
                      child: IconButton(
                        onPressed: () {}, 
                        icon: Icon(Icons.edit_outlined, color: AppColor.whiteColor, size: screenWidth * 0.06,)
                      ),
                    ),
                  )
                ]
              ),
              SizedBox(height: screenHeight * 0.02),
              Text("Ерден Алиев", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),),
              SizedBox(height: screenHeight * 0.005),
              Text("Студент", style: TextStyle(fontSize: screenWidth * 0.045, color: AppColor.profilePageTextColor),),
              SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.textFormFieldBorderColor)
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro")
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
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.work),
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro")
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
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
                  child: TextFormField(
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro") 
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.15),
              Button(
                color: AppColor.mainColor, 
                width: double.infinity, 
                height: screenHeight * 0.06, 
                text: "Редактировать профиль", 
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