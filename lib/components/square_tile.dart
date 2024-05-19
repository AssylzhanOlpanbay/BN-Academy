import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;
  double width;
  double paddingWidth;
  double paddingHeight;
  // double height;
  SquareTile({super.key, required this.imagePath, required this.width, required this.paddingWidth, required this.paddingHeight});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: paddingWidth, vertical: paddingHeight),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        border: Border.all(color: AppColor.textFormFieldBorderColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Image.asset(
        imagePath,
        width: width,
      ),
    );
  }
}