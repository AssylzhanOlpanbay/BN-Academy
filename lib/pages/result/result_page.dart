// import 'package:bn_academy_school/components/button.dart';
// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

// class ResultPage extends StatelessWidget {
//   const ResultPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: Container(
//         margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Text("Результат", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.1),
//             Center(
//               child: CircularPercentIndicator(
//                 animation: true,
//                 animationDuration: 1000,
//                 radius: screenWidth * 0.3,
//                 lineWidth: screenWidth * 0.05,
//                 percent: 0.5,
//                 progressColor: AppColor.mainColor,
//                 center: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("8", style: TextStyle(fontSize: screenWidth * 0.09), textAlign: TextAlign.center,),
//                     Text("баллов", style: TextStyle(fontSize: screenWidth * 0.05), textAlign: TextAlign.center,),
//                   ],
//                 ),
//                 circularStrokeCap: CircularStrokeCap.round,
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.09),
//             Column(
//               children: [
//                 Text("Отличная работа!", style: TextStyle(fontSize: screenWidth * 0.05),),
//                 Text("Ваш результат - 8 из 10.", style: TextStyle(fontSize: screenWidth * 0.05),),
//                 Text("Продолжайте в том же духе!", style: TextStyle(fontSize: screenWidth * 0.05),),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.17),
//             Button(
//               color: AppColor.mainColor, 
//               width: double.infinity, 
//               height: screenHeight * 0.06, 
//               text: "На главную", 
//               press: () {}, 
//               textWidth: screenWidth * 0.05, 
//               textColor: AppColor.whiteColor,
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:bn_academy_school/pages/result/result_data.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:bn_academy_school/components/button.dart';
// import 'package:bn_academy_school/constants/app_color.dart';

// class ResultPage extends StatefulWidget {
//   const ResultPage({super.key});

//   @override
//   _ResultPageState createState() => _ResultPageState();
// }

// class _ResultPageState extends State<ResultPage> {
//   bool isLoading = true;
//   int score = 0;

//   @override
//   void initState() {
//     super.initState();
//     fetchResult();
//   }

//   Future<void> fetchResult() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');

//       if (token != null) {
//         var response = await http.get(
//           Uri.parse("http://localhost:8080/api/v1/tests/all-results"),
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         );

//         if (response.statusCode == 200) {
//           var jsonResponse = jsonDecode(response.body);
//           if (jsonResponse.isNotEmpty) {
//             TestResult result = TestResult.fromJson(jsonResponse[0]);
//             setState(() {
//               score = result.sum;
//               isLoading = false;
//             });
//           }
//         } else {
//           print('Failed to load result: ${response.statusCode}');
//           setState(() {
//             isLoading = false;
//           });
//         }
//       } else {
//         print('Token is null');
//         setState(() {
//           isLoading = false;
//         });
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : Container(
//               margin: EdgeInsets.only(
//                   top: screenHeight * 0.07,
//                   left: screenWidth * 0.05,
//                   right: screenWidth * 0.05),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Text(
//                         "Результат",
//                         style: TextStyle(
//                             fontSize: screenWidth * 0.07,
//                             fontFamily: "TTNormsPro",
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.1),
//                   Center(
//                     child: CircularPercentIndicator(
//                       animation: true,
//                       animationDuration: 1000,
//                       radius: screenWidth * 0.3,
//                       lineWidth: screenWidth * 0.05,
//                       percent: score / 10,
//                       progressColor: AppColor.mainColor,
//                       center: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             score.toString(),
//                             style: TextStyle(fontSize: screenWidth * 0.09),
//                             textAlign: TextAlign.center,
//                           ),
//                           Text(
//                             "баллов",
//                             style: TextStyle(fontSize: screenWidth * 0.05),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                       circularStrokeCap: CircularStrokeCap.round,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.09),
//                   Column(
//                     children: [
//                       Text(
//                         "Отличная работа!",
//                         style: TextStyle(fontSize: screenWidth * 0.05),
//                       ),
//                       Text(
//                         "Ваш результат - $score из 10.",
//                         style: TextStyle(fontSize: screenWidth * 0.05),
//                       ),
//                       Text(
//                         "Продолжайте в том же духе!",
//                         style: TextStyle(fontSize: screenWidth * 0.05),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: screenHeight * 0.17),
//                   Button(
//                     color: AppColor.mainColor,
//                     width: double.infinity,
//                     height: screenHeight * 0.06,
//                     text: "На главную",
//                     press: () {},
//                     textWidth: screenWidth * 0.05,
//                     textColor: AppColor.whiteColor,
//                   ),
//                 ],
//               ),
//             ),
//     );
//   }
// }


import 'dart:convert';
import 'package:bn_academy_school/core/navigation.dart';
import 'package:bn_academy_school/pages/main/main_page.dart';
import 'package:bn_academy_school/pages/result/result_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({super.key});

  @override
  _ResultPageState createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
  bool isLoading = true;
  int score = 0;

  @override
  void initState() {
    super.initState();
    fetchResult();
  }

  Future<void> fetchResult() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');

      if (token != null) {
        var response = await http.get(
          Uri.parse("http://10.0.2.2:8080/api/v1/tests/all-results"),
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          print('jsonResponse: $jsonResponse'); // Debugging line
          if (jsonResponse.isNotEmpty) {
            TestResult result = TestResult.fromJson(jsonResponse[0]);
            setState(() {
              score = result.sum;
              isLoading = false;
            });
          }
        } else {
          print('Failed to load result: ${response.statusCode}');
          setState(() {
            isLoading = false;
          });
        }
      } else {
        print('Token is null');
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      print('Error: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : Container(
              margin: EdgeInsets.only(
                  top: screenHeight * 0.07,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Результат",
                        style: TextStyle(
                            fontSize: screenWidth * 0.07,
                            fontFamily: "TTNormsPro",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  Center(
                    child: CircularPercentIndicator(
                      animation: true,
                      animationDuration: 1000,
                      radius: screenWidth * 0.3,
                      lineWidth: screenWidth * 0.05,
                      percent: score / 10,
                      progressColor: AppColor.mainColor,
                      center: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            score.toString(),
                            style: TextStyle(fontSize: screenWidth * 0.09),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            "баллов",
                            style: TextStyle(fontSize: screenWidth * 0.05),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      circularStrokeCap: CircularStrokeCap.round,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.09),
                  Column(
                    children: [
                      Text(
                        "Отличная работа!",
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                      Text(
                        "Ваш результат - $score из 10.",
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                      Text(
                        "Продолжайте в том же духе!",
                        style: TextStyle(fontSize: screenWidth * 0.05),
                      ),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.17),
                  Button(
                    color: AppColor.mainColor,
                    width: double.infinity,
                    height: screenHeight * 0.06,
                    text: "На главную",
                    press: () {
                      Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const NavigationPage()));
                    },
                    textWidth: screenWidth * 0.05,
                    textColor: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
    );
  }
}



