import 'package:flutter/cupertino.dart';

class Tab1 extends StatelessWidget {
  final String title;
  final String subtitle;
  
  const Tab1({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.bold),),
            SizedBox(height: screenHeight * 0.01),
            Text(subtitle, style: TextStyle(fontSize: screenWidth * 0.04),),
          ],
        ),
      ),
    );
  }
}