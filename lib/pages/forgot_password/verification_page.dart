import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/components/square_tile.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final userCode1 = TextEditingController();
  final userCode2 = TextEditingController();
  final userCode3 = TextEditingController();
  final userCode4 = TextEditingController();

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
                SizedBox(height: screenHeight * 0.1),
                Text("Верификация", style: TextStyle(fontSize: screenWidth * 0.1, fontFamily: "TTNormsPro", fontWeight: FontWeight.w600, color: AppColor.blackColor),),
                SizedBox(height: screenHeight * 0.02),
                Text(
                  "Мы отправили код на почту \nexample@gmail.com",
                  style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: const Color.fromRGBO(131, 139, 161, 1)),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: screenHeight * 0.05),
                Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: userCode1.text.isNotEmpty ? AppColor.textFormFieldFilledBorderColor : AppColor.textFormFieldBorderColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: userCode1,
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
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: userCode2.text.isNotEmpty ? AppColor.textFormFieldFilledBorderColor : AppColor.textFormFieldBorderColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: userCode2,
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
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: userCode3.text.isNotEmpty ? AppColor.textFormFieldFilledBorderColor : AppColor.textFormFieldBorderColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: userCode3,
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
                        ),
                      ),
                      Container(
                        width: screenWidth * 0.2,
                        height: screenHeight * 0.08,
                        decoration: BoxDecoration(
                          border: Border.all(color: userCode4.text.isNotEmpty ? AppColor.textFormFieldFilledBorderColor : AppColor.textFormFieldBorderColor),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: TextFormField(
                          controller: userCode4,
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
                        ),
                      ),
                    ],
                  )
                ),
                SizedBox(height: screenHeight * 0.01),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {}, 
                      child: Text(
                        "Не получили код?",
                        style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold, color: const Color.fromRGBO(106, 112, 124, 1)),
                      )
                    ),
                  ],
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
                SizedBox(height: screenHeight * 0.3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Не получили код?", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),),
                    TextButton(
                      onPressed: () {}, 
                      child: Text("Отправить повторно", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.mainColor),)
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