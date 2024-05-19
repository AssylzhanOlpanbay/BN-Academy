import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/components/square_tile.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final userName = TextEditingController();
  final userEmail = TextEditingController();
  final userPassword = TextEditingController();
  final userConfirmPassword = TextEditingController();

  bool isVisible = false;

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
                Text("Регистрация", style: TextStyle(fontSize: screenWidth * 0.1, fontFamily: "TTNormsPro", fontWeight: FontWeight.w600, color: AppColor.blackColor),),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Введите адрес электронной \nпочты",
                  style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: const Color.fromRGBO(131, 139, 161, 1)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.textFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.textFormFieldBorderColor)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Имя",
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro")
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.textFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.textFormFieldBorderColor)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Почта",
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro")
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.textFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.textFormFieldBorderColor)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
                    child: TextFormField(
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Пароль",
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }, 
                          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Container(
                  decoration: BoxDecoration(
                    color: AppColor.textFormFieldColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: AppColor.textFormFieldBorderColor)
                  ),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
                    child: TextFormField(
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Подтвердите пароль",
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisible = !isVisible;
                            });
                          }, 
                          icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
                        )
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Button(
                  color: AppColor.mainColor, 
                  width: double.infinity, 
                  height: screenHeight * 0.07, 
                  text: "Зарегистрироваться", 
                  press: () {}, 
                  textWidth: screenWidth * 0.05, 
                  textColor: AppColor.whiteColor,
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: screenHeight * 0.002,
                        color: const Color.fromRGBO(232, 236, 244, 1),
                      )
                    ),
                    SizedBox(width: screenWidth * 0.05),
                    Text("Войти с помощью", style: TextStyle(fontSize: screenWidth * 0.035, fontFamily: "TTNormsPro", color: const Color.fromRGBO(106, 112, 124, 1), fontWeight: FontWeight.bold,),),
                    SizedBox(width: screenWidth * 0.05),
                    Expanded(
                      child: Divider(
                        thickness: screenHeight * 0.002,
                        color: const Color.fromRGBO(232, 236, 244, 1),
                      )
                    ),
                  ],
                ),
                SizedBox(height: screenHeight * 0.05),
                Row(
                  children: [
                    SquareTile(
                      imagePath: "assets/images/facebook_ic.png", 
                      width: screenWidth * 0.07,
                      paddingWidth: screenWidth * 0.1,
                      paddingHeight: screenHeight * 0.015,
                    ),
                    const Spacer(),
                    SquareTile(
                      imagePath: "assets/images/google_ic.png", 
                      width: screenWidth * 0.07,
                      paddingWidth: screenWidth * 0.1,
                      paddingHeight: screenHeight * 0.015,
                    ),
                    const Spacer(),
                    SquareTile(
                      imagePath: "assets/images/cib_apple.png", 
                      width: screenWidth * 0.07,
                      paddingWidth: screenWidth * 0.1,
                      paddingHeight: screenHeight * 0.015,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}