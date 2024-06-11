import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/news/data_list.dart';
import 'package:bn_academy_school/pages/news/news_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsInformationPage extends StatelessWidget {
  final Data data;

  const NewsInformationPage(this.data);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              }, 
              icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)
            ),
            SizedBox(height: screenHeight * 0.02),
            Container(
              width: double.infinity,
              height: screenHeight * 0.7,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      data.imageUrl,
                      width: double.infinity, 
                      height: screenHeight * 0.3, 
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(data.title, style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),),
                              SizedBox(height: screenHeight * 0.005),
                              Text(
                                data.subtitle,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 10,
                                style: TextStyle(fontSize: screenWidth * 0.035),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Image.asset("assets/images/tengri_icon.png", width: screenWidth * 0.05,),
                              SizedBox(width: screenWidth * 0.02),
                              Text("TengriNews", style: TextStyle(fontSize: screenWidth * 0.035, color: AppColor.newsButtonBottomTextColor),),
                              const Spacer(),
                              Text(data.date, style: TextStyle(fontSize: screenWidth * 0.035, color: AppColor.newsButtonBottomTextColor),)
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.02),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            Button(
              color: AppColor.mainColor, 
              width: double.infinity, 
              height: screenHeight * 0.06, 
              text: "Перейти на сайт", 
              press: () {
                _launchURL(data.link);
              }, 
              textWidth: screenWidth * 0.04, 
              textColor: AppColor.whiteColor
            )
          ],
        ),
      ),
    );
  }

  String _expandSubtitle(String subtitle) {
    String expandedSubtitle = subtitle;
    int linesToAdd = 10 - (expandedSubtitle.split('\n').length);
    if (linesToAdd > 0) {
      for (int i = 0; i < linesToAdd; i++) {
        expandedSubtitle += '\n';
      }
    }
    return expandedSubtitle;
  }

  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

