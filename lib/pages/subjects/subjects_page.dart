import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/lessons/lessons_page.dart';
import 'package:bn_academy_school/pages/subjects/subject_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  final String className;
  const SubjectPage({Key? key, required this.className});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.01, right: screenWidth * 0.05),
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
                Text(className, style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
                const Spacer(),
                const CircleAvatar(
                  // backgroundImage: NetworkImage("url"),
                )
              ],
            ),
            SizedBox(height: screenWidth * 0.07),
            Container(
              margin: EdgeInsets.only(left: screenWidth * 0.04),
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
            Expanded(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: 1, 
                itemBuilder: (context, index) {
                  return const SubjectItem(title: "title", subtitle: "subtitle", imageUrl: "https://www.kdnuggets.com/wp-content/uploads/math-chalkboard-header-scaled.jpg", lessonNames: [
                    "multiple",
                    "plus",
                  ]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
