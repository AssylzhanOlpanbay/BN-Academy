import 'dart:convert';
import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/controllers/otp_controller.dart';
import 'package:bn_academy_school/pages/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationPage extends StatefulWidget {
  final String email;

  const VerificationPage({super.key, required this.email});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formKey = GlobalKey<FormState>();
  bool isVisible = false;
  final OtpController otpController = Get.put(OtpController());
  final OtpController _otpController = Get.find();

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
                Text(
                  "Верификация",
                  style: TextStyle(
                    fontSize: screenWidth * 0.1,
                    fontFamily: "TTNormsPro",
                    fontWeight: FontWeight.w600,
                    color: AppColor.blackColor,
                  ),
                ),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Мы отправили код на почту \n${_otpController.prefs.getString('email')}",
                  style: TextStyle(
                    fontSize: screenWidth * 0.04,
                    fontFamily: "TTNormsPro",
                    color: const Color.fromRGBO(131, 139, 161, 1),
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                Form(
                  key: _formKey,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      buildCodeField(otpController.firstController, context),
                      buildCodeField(otpController.secondController, context),
                      buildCodeField(otpController.thirdController, context),
                      buildCodeField(otpController.fourthController, context),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.1),
                Button(
                  color: AppColor.mainColor,
                  width: double.infinity,
                  height: screenHeight * 0.07,
                  text: "Продолжить",
                  press: () {
                    if (_formKey.currentState != null && _formKey.currentState!.validate()) {
                      otpController.verifyOtp();
                    }
                  },
                  textWidth: screenWidth * 0.05,
                  textColor: AppColor.whiteColor,
                ),
                SizedBox(height: screenHeight * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Не получили код?",
                      style: TextStyle(
                        fontSize: screenWidth * 0.04,
                        fontFamily: "TTNormsPro",
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        otpController.resendOtp();
                      },
                      child: Text(
                        "Отправить повторно",
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontFamily: "TTNormsPro",
                          color: AppColor.mainColor,
                        ),
                      ),
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

  Widget buildCodeField(TextEditingController controller, BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: screenWidth * 0.2,
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
        border: Border.all(color: controller.text.isNotEmpty ? AppColor.textFormFieldFilledBorderColor : AppColor.textFormFieldBorderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextFormField(
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
          }
        },
        style: TextStyle(fontSize: screenWidth * 0.05),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Пожалуйста, введите код';
          }
          return null;
        },
      ),
    );
  }
}
