import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

class BigCard extends StatelessWidget {
  const BigCard({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: double.infinity,
      height: screenHeight * 1.5,
      decoration: BoxDecoration(
        color: AppColor.whiteColor,
        borderRadius: BorderRadius.circular(10)
      ),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.02),
        child: Column(
          children: [
            Text("Наши пакеты", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500, color: AppColor.mainColor, fontFamily: "TTNormsPro"),),
            SizedBox(height: screenHeight * 0.02),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("VIP", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Занятия 3-5 раз в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Занятия с непосредственным руководителем", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Уроки через ватсап и зум", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("В 1 группе 7-8 учащихся", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("1 занятие 1-5 часов", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("До ЕНТ доступ открыт ко всем базам", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                const Divider(),
                SizedBox(height: screenHeight * 0.02),
                Text("Premium", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Занятия 3-5 раз в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Видеоуроки", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Чат", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("1 экзамен в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("1 обратная связь с куратором в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("До ЕНТ доступ открыт ко всем базам", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                const Divider(),
                SizedBox(height: screenHeight * 0.02),
                Text("Standard", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                SizedBox(height: screenHeight * 0.03),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Занятия 3 раза в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Видеоуроки", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/checkmark_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("Чат", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/cancel_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("1 экзамен в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/cancel_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("1 обратная связь с куратором в неделю", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/cancel_icon.png", width: screenWidth * 0.06, fit: BoxFit.contain,),
                    SizedBox(width: screenWidth * 0.03),
                    Flexible(child: Text("До ЕНТ доступ открыт ко всем базам", style: TextStyle(fontSize: screenWidth * 0.045, fontFamily: "TTNormsPro"),))
                  ],
                ),
                SizedBox(height: screenHeight * 0.02),
              ],
            )
          ],
        ),
      ),
    );
  }
}