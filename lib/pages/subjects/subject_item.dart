import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/video_lesson/video_lesson_page.dart';
import 'package:flutter/material.dart';

class SubjectItem extends StatefulWidget {
  final String title;
  final String subtitle;
  final List<String> lessonNames;

  const SubjectItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.lessonNames,
  }) : super(key: key);

  @override
  _SubjectItemState createState() => _SubjectItemState();
}

class _SubjectItemState extends State<SubjectItem> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      margin: EdgeInsets.only(left: screenWidth * 0.02),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        margin: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.17,
              decoration: BoxDecoration(
                color: AppColor.whiteColor,
                borderRadius: BorderRadius.circular(8),
              ),
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        'https://images.theconversation.com/files/49135/original/22qc7r28-1400667334.jpg?ixlib=rb-4.1.0&q=45&auto=format&w=754&fit=clip',
                        height: screenHeight * 0.15,
                        width: screenWidth * 0.3,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(width: screenWidth * 0.05),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(widget.title, style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold)),
                        Text("${widget.subtitle} уроков", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro",)),
                        SizedBox(height: screenHeight * 0.01),
                        Container(
                    width: screenWidth * 0.3,
                    height: screenHeight * 0.05,
                    decoration: BoxDecoration(
                      color: AppColor.mainColor,
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColor.mainColor),
                    ),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _isExpanded = !_isExpanded;
                        });
                      },
                      child: Text(
                        'Подробнее',
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontFamily: "TTNormsPro",
                          color: AppColor.whiteColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      if (_isExpanded)
        Container(
          decoration: BoxDecoration(
            color: AppColor.whiteColor,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            ...widget.lessonNames.map((lesson) {
              return SizedBox(
                height: screenHeight * 0.05,
                child: ListTile(
                  dense: true,
                  title: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(width: screenWidth * 0.45, child: Text( lesson, overflow: TextOverflow.ellipsis, style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", fontWeight: FontWeight.normal,),)),
                      const Spacer(),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const VideoLessonPage()));
                        }, 
                        child: Text("Пройти урок", style: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro", color: AppColor.learnLessonTextColor),),
                      )
                    ],
                  ),
                  subtitle: const Text(''),
                  isThreeLine: true,
                ),
              );
            }).toList(),
            SizedBox(height: screenHeight * 0.01),
            ],
          ),
        ),
      ],
    ),
    ));
  }
}
