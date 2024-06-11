import 'dart:convert';
import 'dart:io';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/lessons/grade_items.dart';
import 'package:bn_academy_school/pages/profile/profile_controller.dart';
import 'package:bn_academy_school/pages/subjects/subjects_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LessonsPage extends StatefulWidget {
  const LessonsPage({super.key});

  @override
  State<LessonsPage> createState() => _LessonsPageState();
}

class _LessonsPageState extends State<LessonsPage> {
  final ProfileController profileController = Get.put(ProfileController());
  List<Map<String, dynamic>> classNames = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchClassNames();
  }

  Future<void> fetchClassNames() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        List<Map<String, dynamic>> fetchedClassNames = [];
        for (int i = 1; i <= 2; i++) {
          var response = await http.get(
            Uri.parse("http://10.0.2.2:8080/api/v1/grades/$i"), // Replace with your machine's IP address
            headers: {
              'Authorization': 'Bearer $token',
            },
          );

          if (response.statusCode == 200) {
            var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
            fetchedClassNames.add({
              'id': i,
              'name': jsonResponse['name'],
            });
          } else {
            throw Exception('Failed to load class names');
          }
        }
        setState(() {
          classNames = fetchedClassNames;
          isLoading = false;
        });
      } else {
        throw Exception('Token is null');
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      // Handle errors
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(
            top: screenHeight * 0.05,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Уроки",
                style: TextStyle(
                    fontSize: screenWidth * 0.07,
                    fontFamily: "TTNormsPro",
                    fontWeight: FontWeight.bold),
              ),
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
          SizedBox(
            height: screenWidth * 0.1,
            child: CupertinoSearchTextField(
              placeholder: "Поиск",
              placeholderStyle: TextStyle(
                  fontSize: screenWidth * 0.04,
                  fontFamily: "TTNormsPro",
                  color: AppColor.textFormFieldFilledBorderColor),
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
              : Container(
                  width: double.infinity,
                  height: screenHeight * 0.57,
                  decoration: BoxDecoration(
                    color: AppColor.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: screenWidth * 0.02,
                        vertical: screenHeight * 0.02),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: classNames.map((classData) {
                        return Column(
                          children: [
                            GradeItem(
                              width: double.infinity,
                              height: screenHeight * 0.08,
                              text: classData['name'],
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        SubjectPage(classId: classData['id'], className: classData['name']),
                                  ),
                                );
                              },
                              textWidth: screenWidth * 0.05,
                              rowWidth: screenWidth * 0.03,
                            ),
                            SizedBox(height: screenHeight * 0.01),
                          ],
                        );
                      }).toList(),
                    ),
                  ),
                ),
        ]),
      ),
    );
  }
}
