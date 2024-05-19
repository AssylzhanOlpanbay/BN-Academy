import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/login_and_signup/login_and_signup_page.dart';
import 'package:bn_academy_school/pages/welcome/welcome_items.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  final controller = WelcomeItems();
  final pageController = PageController();

  bool isLastPage = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.whiteColor,
      bottomSheet: Container(
        padding: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05, bottom: screenHeight * 0.03),
        color: AppColor.whiteColor,
        child: SingleChildScrollView(
          child: isLastPage? getLastPage() : Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SmoothPageIndicator(
                controller: pageController, 
                count: controller.items.length,
                effect: const WormEffect(
                  spacing: 8,
                  dotWidth: 40,
                  dotHeight: 2,
                  activeDotColor: AppColor.mainColor,
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginAndSignUpPage()));
                    },
                    child: const Text("Пропустить", style: TextStyle(color: AppColor.mainColor),)
                  ),
                  const Spacer(),
                  TextButton(
                    onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 600), 
                      curve: Curves.easeIn,
                    ), 
                    child: const Text("След.", style: TextStyle(color: AppColor.mainColor),)
                  ),
                ],
              )
            ],
          ),
        ),
      ),
      body: PageView.builder(
        onPageChanged: (index) => setState(() => isLastPage = controller.items.length - 1 == index),
        itemCount: controller.items.length,
        controller: pageController,
        itemBuilder: (context, index) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.10),
                child: Image.asset(controller.items[index].image, width: screenWidth * 1, height: screenHeight * 0.4,)
              ),
              const SizedBox(height: 10),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                child: Text(
                  controller.items[index].title, 
                  textAlign: TextAlign.center, 
                  style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, fontFamily: 'TTNormsPro'),
                )
              )
            ],
          );
      })
    );
  }

  Widget getLastPage() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SmoothPageIndicator(
          controller: pageController, 
          count: controller.items.length,
          effect: const WormEffect(
            spacing: 8,
            dotWidth: 40,
            dotHeight: 2,
            activeDotColor: AppColor.mainColor,
          ),
        ),
        SizedBox(height: screenHeight * 0.03),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginAndSignUpPage()));
              }, 
              child: const Text("Сделано", style: TextStyle(color: AppColor.mainColor),)
            ),
          ],
        )
      ],
    );
  }
}