import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class LogOutButton extends StatelessWidget {
  final Color color;
  final double width;
  final double height;
  final String text;
  final VoidCallback press;
  final double textWidth;
  final Color textColor;

  const LogOutButton({super.key, required this.color, required this.width, required this.height, required this.text, required this.press, required this.textWidth, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.redColor),
      ),
      child: TextButton(
        onPressed: press, 
        child: Text(text, style: TextStyle(fontSize: textWidth, fontFamily: "TTNormsPro", color: textColor, fontWeight: FontWeight.w500),)
      ),
    );
  }
}