import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class TestResultCard extends StatelessWidget {
  const TestResultCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.09,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02,),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("График функции", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", fontWeight: FontWeight.w500),),
                Text("Математика", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),)
              ],
            ),
            Spacer(),
            Text("9/10", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.w500, color: AppColor.mainColor,),),
          ],
        ),
      ),
    );
  }
}