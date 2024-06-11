import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

import 'faq_models.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override 
  State<FAQPage> createState() => _FAQPageState();
}   

class _FAQPageState extends State<FAQPage> {
  final List<FAQ> faqs = getFaqs();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: Column(
            children: [
              Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)),
                Text("FAQ", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold, fontFamily: "TTNormsPro"),)
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  border: Border.all(color: AppColor.textFormFieldFilledBorderColor),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    FAQItem(
                      question: 'Как работает приложение?',
                      answer: 'Описание работы приложения...',
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      child: Divider(),
                    ),
                    FAQItem(
                      question: 'Какие предметы охватывает?',
                      answer: 'Список предметов...',
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      child: Divider(),
                    ),
                    FAQItem(
                      question: 'Как мне отслеживать свой прогресс?',
                      answer: 'Описание отслеживания прогресса...',
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      child: Divider(),
                    ),
                    FAQItem(
                      question: 'Могу ли я использовать в оффлайн-режиме?',
                      answer:
                          'Хотя BN Academy предпочительно использовать онлайн для получения обновлений и доступа к новым материалам, некоторые ресурсы могут быть загружены для использования в оффлайн-режиме, чтобы обеспечить непрерывную подготовку.',
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      child: Divider(),
                    ),
                    FAQItem(
                      question: 'Есть ли какие-либо расходы за использование?',
                      answer: 'Описание расходов...',
                    ),
                    Container(
                      width: screenWidth * 0.8,
                      child: Divider(),
                    ),
                    FAQItem(
                      question:
                          'Как я могу получить поддержку, если у меня возникли проблемы с приложением?',
                      answer: 'Описание получения поддержки...',
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FAQItem extends StatefulWidget {
  final String question;
  final String answer;

  FAQItem({required this.question, required this.answer});

  @override
  _FAQItemState createState() => _FAQItemState();
}

class _FAQItemState extends State<FAQItem> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        dividerColor: Colors.transparent,
      ),
      child: ExpansionTile(
        title: Text(widget.question),
        tilePadding: EdgeInsets.symmetric(horizontal: 16.0),
        childrenPadding: EdgeInsets.symmetric(horizontal: 16.0), 
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.answer),
          ),
        ],
        onExpansionChanged: (bool expanding) => setState(() => this.isExpanded = expanding),
      ),
    );
  }
}