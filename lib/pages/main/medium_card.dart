import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class MediumCard extends StatelessWidget {
  const MediumCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
        width: double.infinity,
        height: screenHeight * 0.42,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03, vertical: screenHeight * 0.02),
          child: Column(
            children: [
              Text("Наши преимущества", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500, color: AppColor.mainColor, fontFamily: "TTNormsPro"),),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Image.asset("assets/images/money_icon.png", width: screenWidth * 0.07, fit: BoxFit.contain,),
                  SizedBox(width: screenWidth * 0.03),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Эффективная цена обучения", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                        Text("Рассмотрим скидку на многодетную семью, мать-одиночку!", style: TextStyle(fontSize: screenWidth * 0.04, height: screenHeight * 0.0015, fontFamily: "TTNormsPro"),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Image.asset("assets/images/people_icon2.png", width: screenWidth * 0.07, fit: BoxFit.contain,),
                  SizedBox(width: screenWidth * 0.03),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Макс. количество учащихся  7-8", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                        Text("Для достижения наилучших результатов в одной группе есть максимум 7-8 учеников!", style: TextStyle(fontSize: screenWidth * 0.04, height: screenHeight * 0.0015, fontFamily: "TTNormsPro"),)
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Row(
                children: [
                  Image.asset("assets/images/metodology_icon.png", width: screenWidth * 0.07, fit: BoxFit.contain,),
                  SizedBox(width: screenWidth * 0.03),
                  Flexible(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Особая методология", style: TextStyle(fontSize: screenWidth * 0.045, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                        Text("Занятия в центре объясняются особой методикой!", style: TextStyle(fontSize: screenWidth * 0.04, height: screenHeight * 0.0015, fontFamily: "TTNormsPro"),)
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      );
  }
}