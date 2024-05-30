// import 'dart:math';

// import 'package:bn_academy_school/components/button.dart';
// import 'package:bn_academy_school/components/square_tile.dart';
// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:bn_academy_school/controllers/login_controller.dart';
// import 'package:bn_academy_school/pages/forgot_password/forgot_password_page.dart';
// import 'package:bn_academy_school/pages/forgot_password/verification_page.dart';
// import 'package:bn_academy_school/pages/sign_up/sign_up_page.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({super.key});

//   @override
//   State<LoginPage> createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final LoginController _loginController = Get.put(LoginController());

//   bool isVisible = false;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColor.whiteColor,
//       body: Center(
//         child: Container(
//           margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Text("Вход", style: TextStyle(fontSize: screenWidth * 0.1, fontFamily: "TTNormsPro", fontWeight: FontWeight.w600, color: AppColor.blackColor),),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     "Введите адрес электронной почты, \nуказанный при регистрации",
//                     style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: const Color.fromRGBO(131, 139, 161, 1)),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.textFormFieldColor,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: AppColor.textFormFieldBorderColor),
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
//                       child: TextFormField(
//                         controller: _loginController.emailController,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Почта",
//                           hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Пожалуйста, введите адрес электронной почты';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Container(
//                     decoration: BoxDecoration(
//                       color: AppColor.textFormFieldColor,
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(color: AppColor.textFormFieldBorderColor),
//                     ),
//                     child: Container(
//                       padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.007),
//                       child: TextFormField(
//                         controller: _loginController.passwordController,
//                         obscureText: true,
//                         decoration: InputDecoration(
//                           border: InputBorder.none,
//                           hintText: "Пароль",
//                           hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
//                         ),
//                         validator: (value) {
//                           if (value == null || value.isEmpty) {
//                             return 'Пожалуйста, введите пароль';
//                           }
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.01),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       TextButton(
//                         onPressed: () {
//                           Get.offAll(() => ForgotPasswordPage());
//                         }, 
//                         child: Text(
//                           "Забыли пароль?",
//                           style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold, color: const Color.fromRGBO(106, 112, 124, 1)),
//                         )
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Button(
//                     color: AppColor.mainColor, 
//                     width: double.infinity, 
//                     height: screenHeight * 0.07, 
//                     text: "Войти", 
//                     press: () async {
//                       if (_formKey.currentState?.validate() ?? false) {
//                         await _loginController.loginWithEmail();
//                       }
//                     },
//                     textWidth: screenWidth * 0.05, 
//                     textColor: AppColor.whiteColor,
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Row(
//                     children: [
//                       Expanded(
//                         child: Divider(
//                           thickness: screenHeight * 0.002,
//                           color: const Color.fromRGBO(232, 236, 244, 1),
//                         )
//                       ),
//                       SizedBox(width: screenWidth * 0.05),
//                       Text("Войти с помощью", style: TextStyle(fontSize: screenWidth * 0.035, fontFamily: "TTNormsPro", color: const Color.fromRGBO(106, 112, 124, 1), fontWeight: FontWeight.bold,),),
//                       SizedBox(width: screenWidth * 0.05),
//                       Expanded(
//                         child: Divider(
//                           thickness: screenHeight * 0.002,
//                           color: const Color.fromRGBO(232, 236, 244, 1),
//                         )
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.05),
//                   Row(
//                     children: [
//                       SquareTile(
//                         imagePath: "assets/images/facebook_ic.png", 
//                         width: screenWidth * 0.07,
//                         paddingWidth: screenWidth * 0.1,
//                         paddingHeight: screenHeight * 0.015,
//                       ),
//                       const Spacer(),
//                       SquareTile(
//                         imagePath: "assets/images/google_ic.png", 
//                         width: screenWidth * 0.07,
//                         paddingWidth: screenWidth * 0.1,
//                         paddingHeight: screenHeight * 0.015,
//                       ),
//                       const Spacer(),
//                       SquareTile(
//                         imagePath: "assets/images/cib_apple.png", 
//                         width: screenWidth * 0.07,
//                         paddingWidth: screenWidth * 0.1,
//                         paddingHeight: screenHeight * 0.015,
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.07),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text("Нет аккаунта?", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),),
//                       TextButton(
//                         onPressed: () {
//                           Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
//                         }, 
//                         child: Text("Регистрация", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.mainColor),)
//                       )
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/components/square_tile.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/controllers/login_controller.dart';
import 'package:bn_academy_school/pages/forgot_password/forgot_password_page.dart';
import 'package:bn_academy_school/pages/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final LoginController loginController = Get.put(LoginController());

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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    "Вход",
                    style: TextStyle(
                      fontSize: screenWidth * 0.1,
                      fontFamily: "TTNormsPro",
                      fontWeight: FontWeight.w600,
                      color: AppColor.blackColor,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    "Введите адрес электронной почты, \nуказанный при регистрации",
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontFamily: "TTNormsPro",
                      color: const Color.fromRGBO(131, 139, 161, 1),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.textFormFieldColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.textFormFieldBorderColor),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.007),
                      child: TextFormField(
                        controller: loginController.emailController,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Почта",
                          hintStyle: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontFamily: "TTNormsPro"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите адрес электронной почты';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColor.textFormFieldColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                          color: AppColor.textFormFieldBorderColor),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: screenWidth * 0.03,
                          vertical: screenHeight * 0.007),
                      child: TextFormField(
                        controller: loginController.passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Пароль",
                          hintStyle: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontFamily: "TTNormsPro"),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Пожалуйста, введите пароль';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                          onPressed: () {
                            Get.offAll(() => ForgotPasswordPage());
                          },
                          child: Text(
                            "Забыли пароль?",
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontFamily: "TTNormsPro",
                                fontWeight: FontWeight.bold,
                                color: const Color.fromRGBO(106, 112, 124, 1)),
                          )),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  Button(
                    color: AppColor.mainColor,
                    width: double.infinity,
                    height: screenHeight * 0.07,
                    text: "Войти",
                    press: () async {
                      if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                        loginController.loginWithEmail();
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
                      )),
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
                      )),
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
                  SizedBox(height: screenHeight * 0.07),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Нет аккаунта?",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontFamily: "TTNormsPro"),
                      ),
                      TextButton(
                          onPressed: () {
                             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                          },
                          child: Text(
                            "Регистрация",
                            style: TextStyle(
                                fontSize: screenWidth * 0.04,
                                fontFamily: "TTNormsPro",
                                color: AppColor.mainColor),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

