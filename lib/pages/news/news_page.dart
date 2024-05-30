import 'dart:io';

import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/news/data_list.dart';
import 'package:bn_academy_school/pages/news/news_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

  void updateList(String value) {
    setState(() {
      _news = dataList.where((element) => element.title!.toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  Future<Map<String, String>> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedName = prefs.getString('name') ?? '';
    String savedEmail = prefs.getString('email') ?? '';
    String profileImagePath = prefs.getString('profileImagePath') ?? '';
    return {'name': savedName, 'email': savedEmail, 'profileImagePath': profileImagePath};
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<Map<String, String>>(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          String savedName = snapshot.data?['name'] ?? '';
          String savedEmail = snapshot.data?['email'] ?? '';
          String profileImagePath = snapshot.data?['profileImagePath'] ?? '';
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
                      CircleAvatar(
                        backgroundImage: profileImagePath.isNotEmpty ? FileImage(File(profileImagePath)) : null,
                        child: profileImagePath.isEmpty ? Icon(Icons.person, size: 70) : null,
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05),
                Container(
                  margin: EdgeInsets.only(left: screenWidth * 0.05, right: screenWidth * 0.05),
                  height: screenWidth * 0.1,
                  child: CupertinoSearchTextField(
                    onChanged: (value) => updateList(value),
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
    );
  }
}