import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/news/data_list.dart';
import 'package:bn_academy_school/pages/news/news_information_page.dart';
import 'package:flutter/material.dart';

class NewsButton extends StatelessWidget {
  // final String imageUrl;
  // final String title;
  // final String subtitle;
  // final String date;
  final List news;
  const NewsButton({super.key, required this.news,});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

      return Container(
        width: double.infinity,
        height: screenHeight * 0.5,
        decoration: BoxDecoration(
          color: AppColor.backgroundColor,
          borderRadius: BorderRadius.circular(20)
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
      itemCount: news.length,
      itemBuilder: (context, index) { 
        Data data = news[index]; 
       return Container(
        width: screenWidth * 0.8,
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
        decoration: BoxDecoration(
          color: AppColor.whiteColor,
          borderRadius: BorderRadius.circular(20)
        ),
         child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    child: Image.network(
                      data.imageUrl, 
                      width: double.infinity, 
                      height: screenHeight * 0.25, 
                      fit: BoxFit.cover,
                                ),
                  )
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text(data.title, style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold),),
                    SizedBox(height: screenHeight * 0.005),
                    Text(
                      data.subtitle,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: TextStyle(fontSize: screenWidth * 0.035),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NewsInformationPage(data),
                            ),
                          );
                        },
                        child: Text(
                          'Подробнее',
                          style: TextStyle(fontSize: screenWidth * 0.035, color: AppColor.mainColor),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        Image.asset("assets/images/tengri_icon.png", width: screenWidth * 0.05,),
                        SizedBox(width: screenWidth * 0.02),
                        Text("TengriNews", style: TextStyle(fontSize: screenWidth * 0.035, color: AppColor.newsButtonBottomTextColor),),
                        const Spacer(),
                        Text(data.date, style: TextStyle(fontSize: screenWidth * 0.035, color: AppColor.newsButtonBottomTextColor),)
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
       );
      }
    )
    );
  }
}