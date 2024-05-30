import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/components/square_tile.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/controllers/login_controller.dart';
import 'package:bn_academy_school/controllers/sign_up_controler.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;

  final RegistrationController registrationController = Get.put(RegistrationController());
  final LoginController loginController = Get.put(LoginController());

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Регистрация",
                    style: TextStyle(
                      fontSize: screenWidth * 0.1,
                      fontFamily: "TTNormsPro",
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Введите адрес электронной \nпочты",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontFamily: "TTNormsPro",
                      color: const Color.fromRGBO(131, 139, 161, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  _buildTextFormField(
                    controller: registrationController.nameController,
                    hintText: "Имя",
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildTextFormField(
                    controller: registrationController.emailController,
                    hintText: "Почта",
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildPasswordFormField(
                    controller: registrationController.passwordController,
                    hintText: "Пароль",
                    isVisible: isVisible,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  _buildPasswordFormField(
                    controller: registrationController.confirmPasswordController,
                    hintText: "Подтвердите пароль",
                    isVisible: isVisible,
                    screenWidth: screenWidth,
                    screenHeight: screenHeight,
                    validator: (value) {
                      if (value != registrationController.passwordController.text) {
                        return "Пароли не совпадают!";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Button(
                    color: AppColor.mainColor,
                    width: double.infinity,
                    height: screenHeight * 0.07,
                    text: "Зарегистрироваться",
                    press: () async {
                      if (_formKey.currentState?.validate() ?? false) {
                        await registrationController.registerWithEmail();
                      }
                    },
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
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Text(
                        "Войти с помощью",
                        style: TextStyle(
                          fontSize: screenWidth * 0.035,
                          fontFamily: "TTNormsPro",
                          color: const Color.fromRGBO(106, 112, 124, 1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        child: Divider(
                          thickness: screenHeight * 0.002,
                          color: const Color.fromRGBO(232, 236, 244, 1),
                        ),
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
      ),
    );
  }

  Widget _buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    required double screenWidth,
    required double screenHeight,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.textFormFieldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.textFormFieldBorderColor),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.007,
        ),
        child: TextFormField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.04,
              fontFamily: "TTNormsPro",
            ),
          ),
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Это поле обязательно";
                }
                return null;
              },
        ),
      ),
    );
  }

  Widget _buildPasswordFormField({
    required TextEditingController controller,
    required String hintText,
    required bool isVisible,
    required double screenWidth,
    required double screenHeight,
    FormFieldValidator<String>? validator,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.textFormFieldColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.textFormFieldBorderColor),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.03,
          vertical: screenHeight * 0.007,
        ),
        child: TextFormField(
          controller: controller,
          obscureText: !isVisible,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: screenWidth * 0.04,
              fontFamily: "TTNormsPro",
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  isVisible = !isVisible;
                });
              },
              icon: Icon(isVisible ? Icons.visibility : Icons.visibility_off),
            ),
          ),
          validator: validator ??
              (value) {
                if (value == null || value.isEmpty) {
                  return "Это поле обязательно";
                }
                return null;
              },
        ),
      ),
    );
  }
}

