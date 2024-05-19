import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/lessons/grade_items.dart';
import 'package:bn_academy_school/pages/subjects/subjects_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Уроки", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
                const Spacer(),
                const CircleAvatar(
                  // backgroundImage: NetworkImage("url"),
                )
              ],
            ),
            SizedBox(height: screenWidth * 0.07),
            SizedBox(
              height: screenWidth * 0.1,
              child: CupertinoSearchTextField(
                placeholder: "Поиск",
                placeholderStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.textFormFieldFilledBorderColor),
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColor.textFormFieldBorderColor),
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.03),
            Container(
              width: double.infinity,
              height: screenHeight * 0.57,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GradeItem(
                      width: double.infinity, 
                      height: screenHeight * 0.08, 
                      text: "6 класс", 
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectPage(className: "6 класс"),
                          ),
                        );
                      }, 
                      textWidth: screenWidth * 0.05, 
                      rowWidth: screenWidth * 0.03,
                    ),
                    SizedBox(height: screenHeight * 0.01),
                    GradeItem(
                      width: double.infinity, 
                      height: screenHeight * 0.08, 
                      text: "7 класс", 
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectPage(className: "7 класс"),
                          ),
                        );
                      }, 
                      textWidth: screenWidth * 0.05, 
                      rowWidth: screenWidth * 0.03,),
                    SizedBox(height: screenHeight * 0.01),
                    GradeItem(
                      width: double.infinity, 
                      height: screenHeight * 0.08, 
                      text: "8 класс", 
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectPage(className: "8 класс"),
                          ),
                        );
                      }, 
                      textWidth: screenWidth * 0.05, 
                      rowWidth: screenWidth * 0.03,),
                    SizedBox(height: screenHeight * 0.01),
                    GradeItem(
                      width: double.infinity, 
                      height: screenHeight * 0.08, 
                      text: "9 класс", 
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectPage(className: "9 класс"),
                          ),
                        );
                      }, 
                      textWidth: screenWidth * 0.05, 
                      rowWidth: screenWidth * 0.03,),
                    SizedBox(height: screenHeight * 0.01),
                    GradeItem(
                      width: double.infinity, 
                      height: screenHeight * 0.08, 
                      text: "10 класс", 
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectPage(className: "10 класс"),
                          ),
                        );
                      }, 
                      textWidth: screenWidth * 0.05, 
                      rowWidth: screenWidth * 0.03,),
                    SizedBox(height: screenHeight * 0.01),
                    GradeItem(
                      width: double.infinity, 
                      height: screenHeight * 0.08, 
                      text: "11 класс", 
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SubjectPage(className: "11 класс"),
                          ),
                        );
                      }, 
                      textWidth: screenWidth * 0.05, 
                      rowWidth: screenWidth * 0.03,),
                  ],
                ),
              ),
            )
          ]
        )
      )
    );
  }
}