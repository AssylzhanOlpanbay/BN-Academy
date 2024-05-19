import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/components/square_tile.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class CreateNewPasswordPage extends StatefulWidget {
  const CreateNewPasswordPage({super.key});

  @override
  State<CreateNewPasswordPage> createState() => _CreateNewPasswordPageState();
}

class _CreateNewPasswordPageState extends State<CreateNewPasswordPage> {
  final userNewPassword = TextEditingController();
  final userConfirmNewPassword = TextEditingController();

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
                Text("Создайте новый \nпароль", textAlign: TextAlign.center, style: TextStyle(height: 1.2, fontSize: screenWidth * 0.1, fontFamily: "TTNormsPro", fontWeight: FontWeight.w600, color: AppColor.blackColor),),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Ваш пароль должен быть не \nменее 8 символов",
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
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Новый пароль",
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
                  text: "Продолжить", 
                  press: () {}, 
                  textWidth: screenWidth * 0.05, 
                  textColor: AppColor.whiteColor,
                ),
                SizedBox(height: screenHeight * 0.2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}