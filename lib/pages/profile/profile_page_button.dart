import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class ProfilePageButton extends StatelessWidget {
  final double width;
  final double height;
  final IconData icon;
  final String text;
  final VoidCallback press;
  const   ProfilePageButton({super.key, required this.width, required this.height, required this.icon, required this.text, required this.press});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: press,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          border: Border.all(color: AppColor.textFormFieldBorderColor),
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          margin: EdgeInsets.only(left: screenWidth * 0.02, right: screenWidth * 0.02),
          child: Row(
            children: [
              Container(
                width: screenWidth * 0.1,
                height: screenHeight * 0.05,
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Icon(
                  icon, 
                  color: AppColor.whiteColor, 
                  size: screenWidth * 0.07,
                )
              ),
              SizedBox(width: screenWidth * 0.03),
              Text(text, style: TextStyle(fontSize: screenWidth * 0.045),),
              const Spacer(),
              Icon(Icons.keyboard_arrow_right, size: screenWidth * 0.07)
            ],
          ),
        ),
      ),
    );
  }
}