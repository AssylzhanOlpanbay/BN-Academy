import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ResultPage extends StatelessWidget {
  const ResultPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Результат", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
              ],
            ),
            SizedBox(height: screenHeight * 0.1),
            Center(
              child: CircularPercentIndicator(
                animation: true,
                animationDuration: 1000,
                radius: screenWidth * 0.3,
                lineWidth: screenWidth * 0.05,
                percent: 0.5,
                progressColor: AppColor.mainColor,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("8", style: TextStyle(fontSize: screenWidth * 0.09), textAlign: TextAlign.center,),
                    Text("баллов", style: TextStyle(fontSize: screenWidth * 0.05), textAlign: TextAlign.center,),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ),
            SizedBox(height: screenHeight * 0.09),
            Column(
              children: [
                Text("Отличная работа!", style: TextStyle(fontSize: screenWidth * 0.05),),
                Text("Ваш результат - 8 из 10.", style: TextStyle(fontSize: screenWidth * 0.05),),
                Text("Продолжайте в том же духе!", style: TextStyle(fontSize: screenWidth * 0.05),),
              ],
            ),
            SizedBox(height: screenHeight * 0.17),
            Button(
              color: AppColor.mainColor, 
              width: double.infinity, 
              height: screenHeight * 0.06, 
              text: "На главную", 
              press: () {}, 
              textWidth: screenWidth * 0.05, 
              textColor: AppColor.whiteColor,
            )
          ],
        ),
      ),
    );
  }
}