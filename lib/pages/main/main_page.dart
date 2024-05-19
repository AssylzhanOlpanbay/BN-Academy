import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/main/big_card.dart';
import 'package:bn_academy_school/pages/main/medium_card.dart';
import 'package:bn_academy_school/pages/main/mini_card.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

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
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar()
                ],
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                "BN ACADEMY SCHOOL", 
                style: TextStyle(
                  fontSize: screenWidth * 0.1, 
                  fontWeight: FontWeight.w500, 
                  fontFamily: "Koulen", 
                  color: AppColor.mainColor,
                  shadows: const [ 
                    Shadow(
                      color: AppColor.mainColor,
                      blurRadius: 5,
                      offset: Offset(1, 1),
                    )
                  ]
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              const MiniCard(
                imageUrl: 'assets/images/earth_icon.png', 
                title: '2015', 
                subtile: 'год, когда мы встали на путь образования',
              ),
              const MiniCard(
                imageUrl: 'assets/images/school_icon.png', 
                title: '98%', 
                subtile: 'учеников-обладатели грантов',
              ),
              const MiniCard(
                imageUrl: 'assets/images/people_icon.png', 
                title: '10К+', 
                subtile: 'выпускников',
              ),
              SizedBox(height: screenHeight * 0.03),
              const MediumCard(),
              SizedBox(height: screenHeight * 0.02),
              BigCard(),
            ],
          ),
        ),
      ),
    );
  }
}