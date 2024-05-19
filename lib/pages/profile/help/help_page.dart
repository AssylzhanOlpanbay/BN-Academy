import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/profile/help/help_button.dart';
import 'package:bn_academy_school/pages/profile/profile_page.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(onPressed: () {
                  Navigator.pop(context);
                }, 
                icon: Icon(Icons.arrow_back, size: screenWidth * 0.07,)),
                Text("Группа поддержки", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),)
              ],
            ),
            SizedBox(height: screenHeight * 0.03),
            Text("Колл центр", style: TextStyle(fontSize: screenWidth * 0.04, color: AppColor.helpPageTextColor),),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "www.instagram.com",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/instagram_icon.png', 
              
            ),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "www.whatsapp.com",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/whatsapp_icon.png', 
              
            ),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "mail.google.com",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/google_icon.png', 
              
            ),
            SizedBox(height: screenHeight * 0.05),
            Text("адрес", style: TextStyle(fontSize: screenWidth * 0.04, color: AppColor.helpPageTextColor),),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "Мамыр 4, 49",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/location_icon.png', 
              
            ),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "Сейфуллина 498",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/location_icon.png', 
              
            ),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "Қаскелең: Жангозина 59Б",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/location_icon.png', 
              
            ),
            SizedBox(height: screenHeight * 0.01),
            HelpButton(
              width: double.infinity, 
              height: screenHeight * 0.07, 
              text: "Жібек жолы: Төле би 16",  
              link: "https://www.figma.com/file/iZ1kW0ugrOrxTeplWiM61y/DIPLOMA-PROJECT?type=design&node-id=263-4016&mode=design&t=IxORWGPxcjPn3Plw-0", 
              image: 'assets/images/location_icon.png', 
              
            ),
          ],
        ),
      ),
    );
  }
}