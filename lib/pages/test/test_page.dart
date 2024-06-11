// import 'package:bn_academy_school/components/button.dart';
// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:bn_academy_school/pages/test/test_model.dart';
// import 'package:bn_academy_school/pages/test/test_page_button.dart';
// import 'package:flutter/material.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   List<Question> questionList = getQuestions();
//   int currentQuestionIndex = 0;
//   int score = 0;
//   Answer? selectedAnswer;

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;
    
//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: Container(
//         margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 IconButton(
//                     onPressed: () {
//                     }, 
//                     icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)
//                   ), 
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             Text("Question ${currentQuestionIndex + 1}/${questionList.length.toString()}", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.bold, ),),
//             SizedBox(height: screenHeight * 0.05),
//             Text(questionList[currentQuestionIndex].questionText, style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, ),),
//             SizedBox(height: screenHeight * 0.03),
//             _answerList(),
//             SizedBox(height: screenHeight * 0.05),
//             Row(
//               children: [
//                 TestPageButton1(
//                   width: screenWidth * 0.4, 
//                   height: screenHeight * 0.05,
//                   press: () {
//                     if (currentQuestionIndex > 0) {
//                       setState(() {
//                         currentQuestionIndex--;
//                       });
//                     }
//                   },
//                 ),
//                 const Spacer(),
//                 TestPageButton2(
//                   width: screenWidth * 0.4, 
//                   height: screenHeight * 0.05,
//                   isLastQuestion: currentQuestionIndex == questionList.length - 1,
//                   press: () {
//                     if (currentQuestionIndex == questionList.length - 1) {
//                       showDialog(context: context, builder: (_) => _showScoreDialog());
//                     } else {
//                       setState(() {
//                         currentQuestionIndex++;
//                       });
//                     }
//                   },
//                 ) 
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   _answerList() {
//     return Column(
//       children: questionList[currentQuestionIndex]
//           .answersList
//           .map(
//             (e) => _answerButton(e),
//           )
//           .toList(),
//     );
//   }

//   Widget _answerButton(Answer answer) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     bool isSelected = answer == selectedAnswer;

//     return Container(
//       width: double.infinity,
//       height: screenHeight * 0.09,
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         color: AppColor.whiteColor,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: AppColor.textFormFieldBorderColor),
//       ),
//       child: Container(
//         margin: EdgeInsets.only(left: screenWidth * 0.02),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
//               title: Text(answer.answerText, style: TextStyle(fontSize: screenWidth * 0.045),),
//               leading: Radio<Answer>(
//                 value: answer,
//                 groupValue: selectedAnswer,
//                 onChanged: _handleRadioValueChanged,
//                 activeColor: AppColor.mainColor,
//                 visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleRadioValueChanged(Answer? value) {
//     setState(() {
//       selectedAnswer = value;
//     });
//     if (value != null && value.isCorrect) {
//       score++;
//     }
//   }

//   _showScoreDialog() {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     bool isPassed = false;
//     return AlertDialog(
//       backgroundColor: AppColor.whiteColor,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       title: Column(
//         children: [
//           Icon(Icons.warning_rounded, size: screenWidth * 0.1,),
//           SizedBox(height: screenHeight * 0.01),
//           Text("Вы уверены завершить тест?", style: TextStyle(fontSize: screenWidth * 0.04),)
//         ],
//       ),
//       content: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Button(
//               color: AppColor.mainColor, 
//               width: double.infinity, 
//               height: screenHeight * 0.05 , 
//               text: "Да, уверен", 
//               press: () {
//                 _finishTestAndNavigate();
//               }, 
//               textWidth: screenWidth * 0.04, 
//               textColor: AppColor.whiteColor,
//             ),
//           SizedBox(height: screenHeight * 0.01),  
//           Button(
//               color: AppColor.whiteColor, 
//               width: double.infinity, 
//               height: screenHeight * 0.05 , 
//               text: "Отменить", 
//               press: () {
//                 _cancelFinishTest();
//               }, 
//               textWidth: screenWidth * 0.04, 
//               textColor: AppColor.mainColor,
//             ),
//         ],
//       )
//     );
//   }

//   void _finishTestAndNavigate() {
//   // _saveTestResults();

//   // Навигация на следующую страницу или куда-то еще
//   // Navigator.of(context).pushReplacement(
//   //   MaterialPageRoute(
//   //     builder: (context) => NextPage(score: score),
//   //   ),
//   // );
// }

// void _cancelFinishTest() {
//   Navigator.of(context).pop(); // Закрываем диалог
// }

// }


// import 'dart:convert';
// import 'package:bn_academy_school/components/button.dart';
// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:bn_academy_school/pages/test/test_model.dart';
// import 'package:bn_academy_school/pages/test/test_page_button.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';

// class TestPage extends StatefulWidget {
//   const TestPage({super.key});

//   @override
//   State<TestPage> createState() => _TestPageState();
// }

// class _TestPageState extends State<TestPage> {
//   List<Question> questionList = [];
//   int currentQuestionIndex = 0;
//   Answer? selectedAnswer;
//   bool isLoading = true;

//   @override
//   void initState() {
//     super.initState();
//     fetchQuestions();
//   }

//   Future<void> fetchQuestions() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print('Token: $token');

//       if (token != null) {
//         var response = await http.get(
//           Uri.parse("http://10.0.2.2:8080/api/v1/tests/1"),
//           headers: {
//             'Authorization': 'Bearer $token',
//           },
//         );

//         if (response.statusCode == 200) {
//           var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
//           print('Response data: $jsonResponse');
//           List<Question> fetchedQuestions = [];
//           for (var questionData in jsonResponse) {
//             fetchedQuestions.add(
//               Question(
//                 questionData['question'],
//                 [
//                   Answer(questionData['option1'], questionData['option1'] == questionData['selectedOption']),
//                   Answer(questionData['option2'], questionData['option2'] == questionData['selectedOption']),
//                   Answer(questionData['option3'], questionData['option3'] == questionData['selectedOption']),
//                   Answer(questionData['option4'], questionData['option4'] == questionData['selectedOption']),
//                 ],
//               ),
//             );
//           }
//           setState(() {
//             questionList = fetchedQuestions;
//             isLoading = false;
//           });
//         } else {
//           print('Failed to load questions: ${response.statusCode}');
//           setState(() {
//             isLoading = false;
//           });
//           throw Exception('Failed to load questions');
//         }
//       } else {
//         print('Token is null');
//         setState(() {
//           isLoading = false;
//         });
//         throw Exception('Token is null');
//       }
//     } catch (e) {
//       print('Error: $e');
//       setState(() {
//         isLoading = false;
//       });
//     }
//   }

//   // void submitTest() async {
//   //   try {
//   //     SharedPreferences prefs = await SharedPreferences.getInstance();
//   //     String? token = prefs.getString('token');
//   //     print('Token for submission: $token');

//   //     if (token != null) {
//   //       List<Map<String, dynamic>> answers = [];
//   //       for (var question in questionList) {
//   //         answers.add({
//   //           'question': question.questionText,
//   //           'selectedOption': question.answersList
//   //               .firstWhere((answer) => answer.isCorrect, orElse: () => Answer('', false))
//   //               .answerText,
//   //         });
//   //       }

//   //       print('Answers: $answers');

//   //       var response = await http.post(
//   //         Uri.parse("http://10.0.2.2:8080/api/v1/tests/check-answer"),
//   //         headers: {
//   //           'Authorization': 'Bearer $token',
//   //           'Content-Type': 'application/json',
//   //         },
//   //         body: jsonEncode({'answers': answers}),
//   //       );

//   //       if (response.statusCode == 200) {
//   //         print('Answers submitted successfully');
//   //       } else {
//   //         print('Failed to submit answers: ${response.statusCode}');
//   //         throw Exception('Failed to submit answers');
//   //       }
//   //     } else {
//   //       print('Token is null');
//   //       throw Exception('Token is null');
//   //     }
//   //   } catch (e) {
//   //     print('Error: $e');
//   //   }
//   // }

//   void submitTest() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print('Token for submission: $token');

//       if (token != null) {
//         List<Map<String, dynamic>> answers = [];
//         for (var question in questionList) {
//           answers.add({
//             'question': question.questionText,
//             'selectedOption': question.answersList
//                 .firstWhere((answer) => answer.isCorrect, orElse: () => Answer('', false))
//                 .answerText,
//           });
//         }

//         print('Answers: $answers');

//         var response = await http.post(
//           Uri.parse("http://10.0.2.2:8080/api/v1/tests/check-answer"),
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Content-Type': 'application/json',
//           },
//           body: jsonEncode({'answers': answers}),
//         );

//         if (response.statusCode == 200) {
//           print('Answers submitted successfully');
//         } else {
//           print('Failed to submit answers: ${response.statusCode}');
//           if (response.statusCode == 403) {
//             print('Authorization failed. Please check your token and permissions.');
//           }
//           throw Exception('Failed to submit answers');
//         }
//       } else {
//         print('Token is null');
//         throw Exception('Token is null');
//       }
//     } catch (e) {
//       print('Error: $e');
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
//           : questionList.isEmpty
//               ? Center(child: Text("No questions available"))
//               : Container(
//                   margin: EdgeInsets.only(
//                       top: screenHeight * 0.07,
//                       left: screenWidth * 0.05,
//                       right: screenWidth * 0.05),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             icon: Icon(
//                               Icons.arrow_back,
//                               size: screenWidth * 0.07,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(height: screenHeight * 0.02),
//                       Text(
//                         "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.07,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.05),
//                       Text(
//                         questionList[currentQuestionIndex].questionText,
//                         style: TextStyle(
//                           fontSize: screenWidth * 0.05,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       SizedBox(height: screenHeight * 0.03),
//                       _answerList(),
//                       SizedBox(height: screenHeight * 0.05),
//                       Row(
//                         children: [
//                           TestPageButton1(
//                             width: screenWidth * 0.4,
//                             height: screenHeight * 0.05,
//                             press: () {
//                               if (currentQuestionIndex > 0) {
//                                 setState(() {
//                                   currentQuestionIndex--;
//                                   selectedAnswer = null;
//                                 });
//                               }
//                             },
//                           ),
//                           const Spacer(),
//                           TestPageButton2(
//                             width: screenWidth * 0.4,
//                             height: screenHeight * 0.05,
//                             isLastQuestion: currentQuestionIndex ==
//                                 questionList.length - 1,
//                             press: () {
//                               if (currentQuestionIndex ==
//                                   questionList.length - 1) {
//                                 showDialog(
//                                     context: context,
//                                     builder: (_) => _showScoreDialog());
//                               } else {
//                                 setState(() {
//                                   currentQuestionIndex++;
//                                   selectedAnswer = null;
//                                 });
//                               }
//                             },
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 ),
//     );
//   }

//   _answerList() {
//     return Column(
//       children: questionList[currentQuestionIndex]
//           .answersList
//           .map(
//             (e) => _answerButton(e),
//           )
//           .toList(),
//     );
//   }

//   Widget _answerButton(Answer answer) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     bool isSelected = answer == selectedAnswer;

//     return Container(
//       width: double.infinity,
//       height: screenHeight * 0.09,
//       margin: EdgeInsets.symmetric(vertical: 5),
//       decoration: BoxDecoration(
//         color: AppColor.whiteColor,
//         borderRadius: BorderRadius.circular(10),
//         border: Border.all(color: AppColor.textFormFieldBorderColor),
//       ),
//       child: Container(
//         margin: EdgeInsets.only(left: screenWidth * 0.02),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             ListTile(
//               contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
//               title: Text(
//                 answer.answerText,
//                 style: TextStyle(fontSize: screenWidth * 0.045),
//               ),
//               leading: Radio<Answer>(
//                 value: answer,
//                 groupValue: selectedAnswer,
//                 onChanged: _handleRadioValueChanged,
//                 activeColor: AppColor.mainColor,
//                 visualDensity: VisualDensity(horizontal: -4, vertical: -4),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void _handleRadioValueChanged(Answer? value) {
//     setState(() {
//       selectedAnswer = value;
//     });
//     if (value != null) {
//       // Update selected answer in the question
//       questionList[currentQuestionIndex].answersList.forEach((element) {
//         element.isCorrect = element == value;
//       });
//     }
//   }

//   _showScoreDialog() {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return AlertDialog(
//         backgroundColor: AppColor.whiteColor,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(8),
//         ),
//         title: Column(
//           children: [
//             Icon(
//               Icons.warning_rounded,
//               size: screenWidth * 0.1,
//             ),
//             SizedBox(height: screenHeight * 0.01),
//             Text(
//               "Вы уверены завершить тест?",
//               style: TextStyle(fontSize: screenWidth * 0.04),
//             )
//           ],
//         ),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             Button(
//               color: AppColor.mainColor,
//               width: double.infinity,
//               height: screenHeight * 0.05,
//               text: "Да, уверен",
//               press: () {
//                 submitTest();
//                 Navigator.of(context).pop();
//               },
//               textWidth: screenWidth * 0.04,
//               textColor: AppColor.whiteColor,
//             ),
//             SizedBox(height: screenHeight * 0.01),
//             Button(
//               color: AppColor.whiteColor,
//               width: double.infinity,
//               height: screenHeight * 0.05,
//               text: "Отменить",
//               press: () {
//                 Navigator.of(context).pop();
//               },
//               textWidth: screenWidth * 0.04,
//               textColor: AppColor.mainColor,
//             ),
//           ],
//         ));
//   }
// }

// class Question {
//   final String questionText;
//   final List<Answer> answersList;

//   Question(this.questionText, this.answersList);
// }

// class Answer {
//   final String answerText;
//   bool isCorrect;

//   Answer(this.answerText, this.isCorrect);
// }



import 'dart:convert';
import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/result/result_page.dart';
import 'package:bn_academy_school/pages/test/test_model.dart';
import 'package:bn_academy_school/pages/test/test_page_button.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Question> questionList = [];
  int currentQuestionIndex = 0;
  Answer? selectedAnswer;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchQuestions();
  }

  // Future<void> fetchQuestions() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('token');
  //     print('Token: $token');

  //     if (token != null) {
  //       var response = await http.get(
  //         Uri.parse("http://10.0.2.2:8080/api/v1/tests/1"),
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //         },
  //       );

  //       if (response.statusCode == 200) {
  //         var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
  //         print('Response data: $jsonResponse');

  //         List<Question> fetchedQuestions = [];
  //         for (var questionData in jsonResponse) {
  //           List<Answer> answers = [
  //             Answer(questionData['option1'], questionData['option1'] == questionData['selectedOption']),
  //             Answer(questionData['option2'], questionData['option2'] == questionData['selectedOption']),
  //             Answer(questionData['option3'], questionData['option3'] == questionData['selectedOption']),
  //             Answer(questionData['option4'], questionData['option4'] == questionData['selectedOption']),
  //           ];
  //           Question question = Question(
  //             questionData['id'],
  //             questionData['question'],
  //             answers,
  //             questionData['selectedOption'] ?? '',
  //           );
  //           fetchedQuestions.add(question);
  //         }

  //         setState(() {
  //           questionList = fetchedQuestions;
  //           isLoading = false;
  //         });
  //       } else {
  //         print('Failed to load questions: ${response.statusCode}');
  //         setState(() {
  //           isLoading = false;
  //         });
  //       }
  //     } else {
  //       print('Token is null');
  //       setState(() {
  //         isLoading = false;
  //       });
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  Future<void> fetchQuestions() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('Token: $token');

    if (token != null) {
      var response = await http.get(
        Uri.parse("http://10.0.2.2:8080/api/v1/tests/1"),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(utf8.decode(response.bodyBytes));
        print('Response data: $jsonResponse');

        List<Question> fetchedQuestions = [];
        for (var questionData in jsonResponse) {
          List<Answer> answers = [
            Answer(questionData['option1'], questionData['option1'] == questionData['selectedOption']),
            Answer(questionData['option2'], questionData['option2'] == questionData['selectedOption']),
            Answer(questionData['option3'], questionData['option3'] == questionData['selectedOption']),
            Answer(questionData['option4'], questionData['option4'] == questionData['selectedOption']),
          ];
          Question question = Question(
            questionData['id'],
            questionData['question'],
            answers,
            questionData['correctOption'],
            questionData['topicId'],
            questionData['selectedOption'] ?? '',
          );
          fetchedQuestions.add(question);
        }

        setState(() {
          questionList = fetchedQuestions;
          isLoading = false;
        });
      } else {
        print('Failed to load questions: ${response.statusCode}');
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

  // void submitTest() async {
  //   try {
  //     SharedPreferences prefs = await SharedPreferences.getInstance();
  //     String? token = prefs.getString('token');
  //     print('Token for submission: $token');

  //     if (token != null) {
  //       List<Map<String, dynamic>> answers = [];
  //       for (var question in questionList) {
  //         answers.add({
  //           'id': question.id,
  //           'selectedOption': question.selectedOption,
  //         });
  //       }

  //       print('Answers: $answers');

  //       var response = await http.post(
  //         Uri.parse("http://10.0.2.2:8080/api/v1/tests/check-answer"),
  //         headers: {
  //           'Authorization': 'Bearer $token',
  //           'Content-Type': 'application/json',
  //         },
  //         body: jsonEncode({'answers': answers}),
  //       );

  //       if (response.statusCode == 200) {
  //         print('Answers submitted successfully');
  //       } else {
  //         print('Failed to submit answers: ${response.statusCode}');
  //         if (response.statusCode == 403) {
  //           print('Authorization failed. Please check your token and permissions.');
  //         }
  //       }
  //     } else {
  //       print('Token is null');
  //     }
  //   } catch (e) {
  //     print('Error: $e');
  //   }
  // }

  void submitTest() async {
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print('Token for submission: $token');

    if (token != null) {
      List<Map<String, dynamic>> answers = questionList.map((question) {
        return {
          'id': question.id,
          'question': question.questionText,
          'option1': question.answersList[0].answerText,
          'option2': question.answersList[1].answerText,
          'option3': question.answersList[2].answerText,
          'option4': question.answersList[3].answerText,
          'correctOption': question.correctOption,
          'selectedOption': question.selectedOption,
          'topicId': question.topicId
        };
      }).toList();

      print('Answers: $answers');

      var response = await http.post(
        Uri.parse("http://10.0.2.2:8080/api/v1/tests/check-answer"),
        headers: {
          'Authorization': 'Bearer $token',
          'Content-Type': 'application/json',
        },
        body: jsonEncode(answers),
      );

      if (response.statusCode == 200) {
        print('Answers submitted successfully');
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ResultPage()),
          );
      } else {
        print('Failed to submit answers: ${response.statusCode}');
        if (response.statusCode == 403) {
          print('Authorization failed. Please check your token and permissions.');
        }
      }
    } else {
      print('Token is null');
    }
  } catch (e) {
    print('Error: $e');
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
          : questionList.isEmpty
              ? Center(child: Text("Уже пройдено!"))
              : Container(
                  margin: EdgeInsets.only(
                      top: screenHeight * 0.07,
                      left: screenWidth * 0.05,
                      right: screenWidth * 0.05),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back,
                              size: screenWidth * 0.07,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      Text(
                        "Question ${currentQuestionIndex + 1}/${questionList.length.toString()}",
                        style: TextStyle(
                          fontSize: screenWidth * 0.07,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.05),
                      Text(
                        questionList[currentQuestionIndex].questionText,
                        style: TextStyle(
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.03),
                      _answerList(),
                      SizedBox(height: screenHeight * 0.05),
                      Row(
                        children: [
                          TestPageButton1(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.05,
                            press: () {
                              if (currentQuestionIndex > 0) {
                                setState(() {
                                  currentQuestionIndex--;
                                  selectedAnswer = null;
                                });
                              }
                            },
                          ),
                          const Spacer(),
                          TestPageButton2(
                            width: screenWidth * 0.4,
                            height: screenHeight * 0.05,
                            isLastQuestion: currentQuestionIndex ==
                                questionList.length - 1,
                            press: () {
                              if (currentQuestionIndex ==
                                  questionList.length - 1) {
                                showDialog(
                                    context: context,
                                    builder: (_) => _showScoreDialog());
                              } else {
                                setState(() {
                                  currentQuestionIndex++;
                                  selectedAnswer = null;
                                });
                              }
                            },
                          )
                        ],
                      )
                    ],
                  ),
                ),
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isSelected = answer == selectedAnswer;

    return Container(
      width: double.infinity,
      height: screenHeight * 0.09,
      margin: EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColor.textFormFieldBorderColor),
      ),
      child: Container(
        margin: EdgeInsets.only(left: screenWidth * 0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0.0),
              title: Text(
                answer.answerText,
                style: TextStyle(fontSize: screenWidth * 0.045),
              ),
              leading: Radio<Answer>(
                value: answer,
                groupValue: selectedAnswer,
                onChanged: _handleRadioValueChanged,
                activeColor: AppColor.mainColor,
                visualDensity: VisualDensity(horizontal: -4, vertical: -4),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleRadioValueChanged(Answer? value) {
    setState(() {
      selectedAnswer = value;
    });
    if (value != null) {
      questionList[currentQuestionIndex].answersList.forEach((element) {
        element.isCorrect = element == value;
      });
      questionList[currentQuestionIndex].selectedOption = value.answerText;
    }
  }

  _showScoreDialog() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return AlertDialog(
        backgroundColor: AppColor.whiteColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        title: Column(
          children: [
            Icon(
              Icons.warning_rounded,
              size: screenWidth * 0.1,
            ),
            SizedBox(height: screenHeight * 0.01),
            Text(
              "Вы уверены завершить тест?",
              style: TextStyle(fontSize: screenWidth * 0.04),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Button(
              color: AppColor.mainColor,
              width: double.infinity,
              height: screenHeight * 0.05,
              text: "Да, уверен",
              press: () {
                submitTest();
                Navigator.of(context).pop();
              },
              textWidth: screenWidth * 0.04,
              textColor: AppColor.whiteColor,
            ),
            SizedBox(height: screenHeight * 0.01),
            Button(
              color: AppColor.whiteColor,
              width: double.infinity,
              height: screenHeight * 0.05,
              text: "Отменить",
              press: () {
                Navigator.of(context).pop();
              },
              textWidth: screenWidth * 0.04,
              textColor: AppColor.mainColor,
            ),
          ],
        ));
  }
}

// class Question {
//   final int id;
//   final String questionText;
//   final List<Answer> answersList;
//   String selectedOption;

//   Question(this.id, this.questionText, this.answersList, this.selectedOption);
// }

class Question {
  final int id;
  final String questionText;
  final List<Answer> answersList;
  final String correctOption;
  final int topicId;
  String selectedOption;

  Question(this.id, this.questionText, this.answersList, this.correctOption, this.topicId, this.selectedOption);
}

class Answer {
  final String answerText;
  bool isCorrect;

  Answer(this.answerText, this.isCorrect);
}


