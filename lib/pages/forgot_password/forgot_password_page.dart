import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/components/square_tile.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final userEmail = TextEditingController();
  
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
                SizedBox(height: screenHeight * 0.1),
                Text("Забыли пароль?", style: TextStyle(fontSize: screenWidth * 0.1, fontFamily: "TTNormsPro", fontWeight: FontWeight.w600, color: AppColor.blackColor),),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Введите адрес электронной почты, \nуказанный при регистрации",
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
                        hintText: "Почта",
                        hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro")
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.07),
                Button(
                  color: AppColor.mainColor, 
                  width: double.infinity, 
                  height: screenHeight * 0.07, 
                  text: "Отправить код", 
                  press: () {}, 
                  textWidth: screenWidth * 0.05, 
                  textColor: AppColor.whiteColor,
                ),
                SizedBox(height: screenHeight * 0.35),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Вспомнили пароль?", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),),
                    TextButton(
                      onPressed: () {}, 
                      child: Text("Войти", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.mainColor),)
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}