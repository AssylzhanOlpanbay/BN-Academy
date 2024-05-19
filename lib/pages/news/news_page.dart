import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/news/data_list.dart';
import 'package:bn_academy_school/pages/news/news_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {

  NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  List _news = [];

  @override
  initState() {
    _news = dataList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                child: Row(
                  children: [
                    Text("Новости", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.bold),),
                    const Spacer(),
                    CircleAvatar()
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                height: screenWidth * 0.1,
                child: CupertinoSearchTextField(
                  placeholder: "Поиск",
                  placeholderStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.textFormFieldFilledBorderColor),
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: AppColor.textFormFieldBorderColor),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                child: Text(
                  "Последние новости", 
                  style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                )
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                height: screenHeight * 0.5,
                child: Expanded(
                  child: _news.isNotEmpty
                  ? NewsButton(news: _news)
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                child: Text(
                  "Популярные новости", 
                  style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),
                )
              ),
              SizedBox(height: screenHeight * 0.03),
              Container(
                height: screenHeight * 0.5,
                child: Expanded(
                  child: _news.isNotEmpty
                  ? NewsButton(news: _news)
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}