import 'dart:convert';
import 'dart:io';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/profile/profile_controller.dart';
import 'package:bn_academy_school/pages/subjects/subject_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SubjectPage extends StatefulWidget {
  final int classId;
  final String className;
  const SubjectPage({Key? key, required this.classId, required this.className}) : super(key: key);

  @override
  _SubjectPageState createState() => _SubjectPageState();
}

class _SubjectPageState extends State<SubjectPage> {
  final ProfileController profileController = Get.put(ProfileController());
  List<Map<String, dynamic>> lessons = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchLessons();
  }

  Future<void> fetchLessons() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    if (token != null) {
      var response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/v1/lessons/${widget.classId}"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      print('Response Body: ${response.body}'); // Debug JSON response

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        print('Parsed JSON: $jsonResponse'); // Debug parsed JSON

        List<Map<String, dynamic>> fetchedLessons = [];
        for (var lesson in jsonResponse) {
          var lessonId = lesson['id'];
          var topicsResponse = await http.get(
            Uri.parse("http://10.0.2.2:8080/api/v1/topics/$lessonId"),
            headers: {
              'Authorization': 'Bearer $token',
            },
          );

          List<String> lessonNames = [];
          if (topicsResponse.statusCode == 200) {
            var topicsJsonResponse = jsonDecode(utf8.decode(topicsResponse.bodyBytes));
            lessonNames = List<String>.from(topicsJsonResponse.map((topic) => topic['name']));
          } else {
            print('Failed to load topics: ${topicsResponse.statusCode}');
          }

          fetchedLessons.add({
            'id': lesson['id'],
            'name': lesson['name'],
            'gradeId': lesson['gradeId'],
            'kolvourokov': int.parse(lesson['kolvourokov']),
            'lessonNames': lessonNames,
          });
          print(lessonNames);
        }

        setState(() {
          lessons = fetchedLessons;
          isLoading = false;
        });
      } else {
        print('Failed to load lessons: ${response.statusCode}'); // Debug status code
        throw Exception('Failed to load lessons');
      }
    } else {
      print('Token is null'); // Debug token issue
      throw Exception('Token is null');
    }
  } catch (e) {
    setState(() {
      isLoading = false;
    });
    // Handle errors
    print('Error: $e');
  }
}




  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.01, right: screenWidth * 0.05),
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
                Text(widget.className, style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
                const Spacer(),
                CircleAvatar(
                  backgroundImage: profileController.profileImagePath.value.isNotEmpty
                      ? FileImage(File(profileController.profileImagePath.value))
                      : null,
                  child: profileController.profileImagePath.value.isEmpty
                      ? Icon(Icons.person, size: 30)
                      : null,
                ),
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
            SizedBox(height: screenHeight * 0.03),
            isLoading
              ? CircularProgressIndicator()
              : Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: lessons.length,
                    itemBuilder: (context, index) {
                      var lesson = lessons[index];
                      return SubjectItem(
                        title: lesson['name'],
                        subtitle: lesson['kolvourokov'].toString(),
                        lessonNames: List<String>.from(lesson['lessonNames']),
                      );
                    },
                  ),
                ),
          ],
        ),
      ),
    );
  }
}
