import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/progress/test_result_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:table_calendar/table_calendar.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  DateTime today = DateTime.now();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text("Прогресс", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
                  const Spacer(),
                  CircleAvatar()
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset("assets/images/progress_icon.png", width: screenWidth * 0.2, fit: BoxFit.contain,),
                  SizedBox(height: screenHeight * 0.02),
                  Text("8", style: TextStyle(fontSize: screenWidth * 0.12, fontFamily: "TTNormsPro", color: AppColor.mainColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                  Text("дней подряд", style: TextStyle(fontSize: screenWidth * 0.05, height: 0.7, fontFamily: "TTNormsPro"), textAlign: TextAlign.center,),
                ],
              )
            ),
            SizedBox(height: screenHeight * 0.05),
            Container(
              width: double.infinity,
              height: screenHeight * 0.12,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Дни", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                        Text("4", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),)
                      ],
                    ),
                    const Spacer(),
                    const VerticalDivider(color: AppColor.textFormFieldBorderColor,),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Уроки", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                        Text("12", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),)
                      ],
                    ),
                    const Spacer(),
                    const VerticalDivider(color: AppColor.textFormFieldBorderColor,),
                    const Spacer(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Минуты", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                        Text("320", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(10)
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
                child: TableCalendar(
                  focusedDay: today, 
                  firstDay: DateTime(2010, 01, 01), 
                  lastDay: DateTime(2030, 01, 01)
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Text("Изученные уроки", style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w500),),
            SizedBox(height: screenHeight * 0.05),
            TestResultCard(),
            ],
          ),
        ),
      ),
    );
  }
}