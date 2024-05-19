import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpButton extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  // final P icon;
  final String link;
  final String image;
  // final VoidCallback press;

  const HelpButton({super.key, required this.width, required this.height, required this.text, required this.link, required this.image});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        _launchURL(link);
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(image, width: screenWidth * 0.07, fit: BoxFit.contain,),
              SizedBox(width: screenWidth * 0.02),
              Text(text, style: TextStyle(fontSize: screenWidth * 0.045, color: AppColor.helpPageSocialTextColor)),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
