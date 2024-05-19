import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class MiniCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String subtile;

  const MiniCard({super.key, required this.imageUrl, required this.title, required this.subtile});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      child: Container(
        width: double.infinity,
        height: screenHeight * 0.13,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.01),
          child: Row(
            children: [
              Image.asset(imageUrl, width: screenWidth * 0.15, fit: BoxFit.contain,),
              SizedBox(width: screenWidth * 0.03),
              Flexible(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.bold, fontFamily: "TTNormsPro"),),
                    Text(subtile, style: TextStyle(fontSize: screenWidth * 0.04, height: screenHeight * 0.0015, fontWeight: FontWeight.w500, color: AppColor.helpPageTextColor, fontFamily: "TTNormsPro"),)
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}