import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/subjects/subjects_page.dart';
import 'package:bn_academy_school/pages/video_lesson/tab1.dart';
import 'package:bn_academy_school/pages/video_lesson/tab2.dart';
import 'package:bn_academy_school/pages/video_lesson/video_player_section.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class VideoLessonPage extends StatefulWidget {


  const VideoLessonPage({super.key});

  @override
  State<VideoLessonPage> createState() => _VideoLessonPageState();
}

class _VideoLessonPageState extends State<VideoLessonPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  }, 
                  icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)
                ),
                const Spacer(),
                const CircleAvatar(
                  // backgroundImage: NetworkImage("url"),
                )
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            YoutubePlayerSection(),
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.07,
                    decoration: BoxDecoration(
                      color: AppColor.backgroundColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: screenHeight * 0.005),
                          child: TabBar(
                            unselectedLabelColor: AppColor.unSelectedLabelColor,
                            labelColor: AppColor.labelColor,
                            indicatorColor: AppColor.mainColor,
                            controller: tabController,
                            indicatorWeight: 2,
                            indicatorPadding: EdgeInsets.zero,
                            indicatorSize: TabBarIndicatorSize.tab,
                            tabs: [
                              Tab(
                                text: "Об уроке",
                              ),
                              Tab(
                                text: "Текстовое объяснение",
                              )
                            ]
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.35,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Tab1(
                          title: "График функции", 
                          subtitle: "Каково определение графика функции? \nКакие основные шаги необходимо выполнить для построения графика функции? \nКак интерпретировать ось X и ось Y на графике функции? \nКакие виды точек (экстремумы, точки перегиба) можно выделить на графике функции и как их идентифицировать? \nКаковы методы определения нулей функции на ее графике? \nКакие виды функций обладают особыми свойствами на своем графике (например, асимптоты)?"
                        ),
                        Tab2(
                          title: "График функции", 
                          subtitle: "График функции представляет собой визуальное отображение зависимости между входными (x) и выходными f(x) значениями функции. \nВ декартовой системе координат аргумент x обычно располагается по оси x, а соответствующие значения функции f(x) по оси y. Это позволяет наглядно представить поведение функции и анализировать ее характеристики, такие как пересечения с осями, экстремумы, асимптоты и другие важные особенности. График функции играет ключевую роль в математическом анализе и приложениях, облегчая понимание ее свойств и поведения."
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Button(
                    color: AppColor.mainColor, 
                    width: double.infinity, 
                    height: screenHeight * 0.06, 
                    text: "Начать тест", 
                    press: () {}, 
                    textWidth: screenWidth * 0.05, 
                    textColor: AppColor.whiteColor,
                  ),
                ],
              ),
            )
          ]
        )
      )
    );
  }
}