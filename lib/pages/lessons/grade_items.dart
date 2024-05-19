import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class GradeItem extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final VoidCallback press;
  final double textWidth;
  final double rowWidth;

  const GradeItem({super.key, required this.width, required this.height, required this.text, required this.press, required this.textWidth, required this.rowWidth});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.gradeBackgroundColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: rowWidth),
          child: Row(
            children: [
              Text(text, style: TextStyle(fontSize: textWidth, fontFamily: "TTNormsPro", color: AppColor.gradeTextColor, fontWeight: FontWeight.w500),),
              const Spacer(),
              const Icon(Icons.arrow_forward_ios, color: Colors.grey),
            ],
          ),
        )
      ),
    );
  }
}