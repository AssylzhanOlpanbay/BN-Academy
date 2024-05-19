import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/test/test_model.dart';
import 'package:bn_academy_school/pages/test/test_page_button.dart';
import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  const TestPage({super.key});

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
  List<Question> questionList = getQuestions();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () {
                    }, 
                    icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)
                  ), 
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            Text("Question ${currentQuestionIndex + 1}/${questionList.length.toString()}", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.bold, ),),
            SizedBox(height: screenHeight * 0.05),
            Text(questionList[currentQuestionIndex].questionText, style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold, ),),
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
                      });
                    }
                  },
                ),
                const Spacer(),
                TestPageButton2(
                  width: screenWidth * 0.4, 
                  height: screenHeight * 0.05,
                  isLastQuestion: currentQuestionIndex == questionList.length - 1,
                  press: () {
                    if (currentQuestionIndex == questionList.length - 1) {
                      showDialog(context: context, builder: (_) => _showScoreDialog());
                    } else {
                      setState(() {
                        currentQuestionIndex++;
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
              title: Text(answer.answerText, style: TextStyle(fontSize: screenWidth * 0.045),),
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
    if (value != null && value.isCorrect) {
      score++;
    }
  }

  _showScoreDialog() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isPassed = false;
    return AlertDialog(
      backgroundColor: AppColor.whiteColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Column(
        children: [
          Icon(Icons.warning_rounded, size: screenWidth * 0.1,),
          SizedBox(height: screenHeight * 0.01),
          Text("Вы уверены завершить тест?", style: TextStyle(fontSize: screenWidth * 0.04),)
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Button(
              color: AppColor.mainColor, 
              width: double.infinity, 
              height: screenHeight * 0.05 , 
              text: "Да, уверен", 
              press: () {
                _finishTestAndNavigate();
              }, 
              textWidth: screenWidth * 0.04, 
              textColor: AppColor.whiteColor,
            ),
          SizedBox(height: screenHeight * 0.01),  
          Button(
              color: AppColor.whiteColor, 
              width: double.infinity, 
              height: screenHeight * 0.05 , 
              text: "Отменить", 
              press: () {
                _cancelFinishTest();
              }, 
              textWidth: screenWidth * 0.04, 
              textColor: AppColor.mainColor,
            ),
        ],
      )
    );
  }

  void _finishTestAndNavigate() {
  // _saveTestResults();

  // Навигация на следующую страницу или куда-то еще
  // Navigator.of(context).pushReplacement(
  //   MaterialPageRoute(
  //     builder: (context) => NextPage(score: score),
  //   ),
  // );
}

void _cancelFinishTest() {
  Navigator.of(context).pop(); // Закрываем диалог
}

}