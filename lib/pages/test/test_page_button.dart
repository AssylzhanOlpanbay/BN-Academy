import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class TestPageButton1 extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback press;

  const TestPageButton1({super.key, required this.width, required this.height, required this.press});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.textFormFieldFilledBorderColor),
      ),
      child: GestureDetector(
        onTap: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.arrow_back, color: AppColor.testPageTextColor),
            SizedBox(width: screenWidth * 0.02),
            Text("Предыдущий", style: TextStyle(fontSize: screenWidth * 0.04, color: AppColor.testPageTextColor, fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
}

class TestPageButton2 extends StatelessWidget {
  final bool isLastQuestion;
  final double width;
  final double height;
  final VoidCallback press;

  const TestPageButton2({super.key, required this.width, required this.height, required this.press, required this.isLastQuestion});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.mainColor),
      ),
      child: GestureDetector(
        onTap: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Следующий", style: TextStyle(fontSize: screenWidth * 0.04, color: AppColor.whiteColor, fontWeight: FontWeight.bold),),
            SizedBox(width: screenWidth * 0.02),
            const Icon(Icons.arrow_forward, color: AppColor.whiteColor),
          ],
        ),
      )
    );
  }
}

class TestPageEndButton extends StatelessWidget {
  final double width;
  final double height;
  final VoidCallback press;

  const TestPageEndButton({super.key, required this.width, required this.height, required this.press});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColor.mainColor,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColor.mainColor),
      ),
      child: GestureDetector(
        onTap: press,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Завершить тест", style: TextStyle(fontSize: screenWidth * 0.04, color: AppColor.whiteColor, fontWeight: FontWeight.bold),),
          ],
        ),
      )
    );
  }
}