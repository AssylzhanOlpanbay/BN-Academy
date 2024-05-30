// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:bn_academy_school/controllers/logout_controller.dart';
// import 'package:bn_academy_school/pages/profile/faq/faq_page.dart';
// import 'package:bn_academy_school/pages/profile/help/help_page.dart';
// import 'package:bn_academy_school/pages/profile/log_out_button.dart';
// import 'package:bn_academy_school/pages/profile/profile_page_button.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatefulWidget {
//   final String name;
//   final String email;
//   const ProfilePage({Key? key, required this.name, required this.email}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final LogoutController logoutController = Get.put(LogoutController());

//   @override
//   Widget build(BuildContext context) {
    
//     Future<Map<String, String>> getUserInfo() async {
//       final SharedPreferences prefs = await SharedPreferences.getInstance();
//       String savedName = prefs.getString('name') ?? '';
//       String savedEmail = prefs.getString('email') ?? '';
//       return {'name': savedName, 'email': savedEmail};
//     }


//     return FutureBuilder(
//       future: getUserInfo(), 
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return CircularProgressIndicator();
//         } else {
//           String savedName = snapshot.data?['name'] ?? '';
//           String savedEmail = snapshot.data?['email'] ?? '';

//           double screenWidth = MediaQuery.of(context).size.width;
//           double screenHeight = MediaQuery.of(context).size.height;

//           return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: Container(
//         margin: EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.05, right: screenWidth * 0.05),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const CircleAvatar(
//               radius: 70,
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             Text(widget.name, style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold),),
//             SizedBox(height: screenHeight * 0.005),
//             Text(widget.email, style: TextStyle(fontSize: screenWidth * 0.045, color: AppColor.profilePageTextColor),),
//             SizedBox(height: screenHeight * 0.03),
//             Container(
//               width: double.infinity,
//               height: screenHeight * 0.4,
//               decoration: BoxDecoration(
//                 color: AppColor.whiteColor,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: Container(
//                 margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.02, right: screenWidth * 0.02),
//                 child: Column(
//                   children: [
//                     ProfilePageButton(
//                       width: double.infinity, 
//                       height: screenHeight * 0.075, 
//                       icon: Icons.person_2_outlined, 
//                       text: "Мой аккаунт", 
//                       press: () {},
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     ProfilePageButton(
//                       width: double.infinity, 
//                       height: screenHeight * 0.075, 
//                       icon: Icons.lock_outline_rounded, 
//                       text: "Сброс пароля", 
//                       press: () {},
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     ProfilePageButton(
//                       width: double.infinity, 
//                       height: screenHeight * 0.075, 
//                       icon: Icons.question_mark_outlined, 
//                       text: "FAQ", 
//                       press: () {
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FAQPage()));
//                       },
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     ProfilePageButton(
//                       width: double.infinity, 
//                       height: screenHeight * 0.075, 
//                       icon: Icons.chat_outlined, 
//                       text: "Группа поддержки", 
//                       press: () {
//                         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HelpPage()));
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.03),
//             LogOutButton(
//               color: AppColor.redColor, 
//               width: double.infinity, 
//               height: screenHeight * 0.06, 
//               text: "Выйти", 
//               press: () {
//                 logoutController.logout();
//               }, 
//               textWidth: screenWidth * 0.045, 
//               textColor: AppColor.whiteColor
//             )
//           ],
//         ),
//       ),
//     );
//         }
//       }
//     );
//   }
// }

// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:bn_academy_school/controllers/logout_controller.dart';
// import 'package:bn_academy_school/pages/profile/edit_profile/edit_profile.dart';
// import 'package:bn_academy_school/pages/profile/faq/faq_page.dart';
// import 'package:bn_academy_school/pages/profile/help/help_page.dart';
// import 'package:bn_academy_school/pages/profile/log_out_button.dart';
// import 'package:bn_academy_school/pages/profile/profile_page_button.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({Key? key}) : super(key: key);

//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }

// class _ProfilePageState extends State<ProfilePage> {
//   final LogoutController logoutController = Get.put(LogoutController());

//   Future<Map<String, String>> getUserInfo() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String savedName = prefs.getString('name') ?? '';
//     String savedEmail = prefs.getString('email') ?? '';
//     return {'name': savedName, 'email': savedEmail};
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return FutureBuilder<Map<String, String>>(
//       future: getUserInfo(),
//       builder: (context, snapshot) {
//         if (snapshot.connectionState == ConnectionState.waiting) {
//           return Center(child: CircularProgressIndicator());
//         } else {
//           if (snapshot.hasError) {
//             return Center(child: Text("Error: ${snapshot.error}"));
//           }

//           String savedName = snapshot.data?['name'] ?? '';
//           String savedEmail = snapshot.data?['email'] ?? '';

//           return Scaffold(
//             backgroundColor: AppColor.backgroundColor,
//             body: Container(
//               margin: EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.05, right: screenWidth * 0.05),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   const CircleAvatar(
//                     radius: 70,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(savedName.isNotEmpty ? savedName : 'No Name', style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
//                   SizedBox(height: screenHeight * 0.005),
//                   Text(savedEmail, style: TextStyle(fontSize: screenWidth * 0.045, color: AppColor.profilePageTextColor)),
//                   SizedBox(height: screenHeight * 0.03),
//                   Container(
//                     width: double.infinity,
//                     height: screenHeight * 0.4,
//                     decoration: BoxDecoration(
//                       color: AppColor.whiteColor,
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     child: Container(
//                       margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.02, right: screenWidth * 0.02),
//                       child: Column(
//                         children: [
//                           ProfilePageButton(
//                             width: double.infinity,
//                             height: screenHeight * 0.075,
//                             icon: Icons.person_2_outlined,
//                             text: "Мой аккаунт",
//                             press: () {
//                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
//                             },
//                           ),
//                           SizedBox(height: screenHeight * 0.02),
//                           ProfilePageButton(
//                             width: double.infinity,
//                             height: screenHeight * 0.075,
//                             icon: Icons.lock_outline_rounded,
//                             text: "Сброс пароля",
//                             press: () {},
//                           ),
//                           SizedBox(height: screenHeight * 0.02),
//                           ProfilePageButton(
//                             width: double.infinity,
//                             height: screenHeight * 0.075,
//                             icon: Icons.question_mark_outlined,
//                             text: "FAQ",
//                             press: () {
//                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FAQPage()));
//                             },
//                           ),
//                           SizedBox(height: screenHeight * 0.02),
//                           ProfilePageButton(
//                             width: double.infinity,
//                             height: screenHeight * 0.075,
//                             icon: Icons.chat_outlined,
//                             text: "Группа поддержки",
//                             press: () {
//                               Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HelpPage()));
//                             },
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.03),
//                   LogOutButton(
//                     color: AppColor.redColor,
//                     width: double.infinity,
//                     height: screenHeight * 0.06,
//                     text: "Выйти",
//                     press: () {
//                       logoutController.logout();
//                     },
//                     textWidth: screenWidth * 0.045,
//                     textColor: AppColor.whiteColor,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }


import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/controllers/logout_controller.dart';
import 'package:bn_academy_school/pages/profile/edit_profile/edit_profile.dart';
import 'package:bn_academy_school/pages/profile/faq/faq_page.dart';
import 'package:bn_academy_school/pages/profile/help/help_page.dart';
import 'package:bn_academy_school/pages/profile/log_out_button.dart';
import 'package:bn_academy_school/pages/profile/profile_page_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final LogoutController logoutController = Get.put(LogoutController());

  Future<Map<String, String>> getUserInfo() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String savedName = prefs.getString('name') ?? '';
    String savedEmail = prefs.getString('email') ?? '';
    String profileImagePath = prefs.getString('profileImagePath') ?? '';
    return {'name': savedName, 'email': savedEmail, 'profileImagePath': profileImagePath};
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return FutureBuilder<Map<String, String>>(
      future: getUserInfo(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          String savedName = snapshot.data?['name'] ?? '';
          String savedEmail = snapshot.data?['email'] ?? '';
          String profileImagePath = snapshot.data?['profileImagePath'] ?? '';

          return Scaffold(
            backgroundColor: AppColor.backgroundColor,
            body: Container(
              margin: EdgeInsets.only(top: screenHeight * 0.1, left: screenWidth * 0.05, right: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: profileImagePath.isNotEmpty ? FileImage(File(profileImagePath)) : null,
                    child: profileImagePath.isEmpty ? Icon(Icons.person, size: 70) : null,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(savedName.isNotEmpty ? savedName : 'No Name', style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
                  SizedBox(height: screenHeight * 0.005),
                  Text(savedEmail, style: TextStyle(fontSize: screenWidth * 0.045, color: AppColor.profilePageTextColor)),
                  SizedBox(height: screenHeight * 0.03),
                  Container(
                    width: double.infinity,
                    height: screenHeight * 0.4,
                    decoration: BoxDecoration(
                      color: AppColor.whiteColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      margin: EdgeInsets.only(top: screenHeight * 0.02, left: screenWidth * 0.02, right: screenWidth * 0.02),
                      child: Column(
                        children: [
                          ProfilePageButton(
                            width: double.infinity,
                            height: screenHeight * 0.075,
                            icon: Icons.person_2_outlined,
                            text: "Мой аккаунт",
                            press: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          ProfilePageButton(
                            width: double.infinity,
                            height: screenHeight * 0.075,
                            icon: Icons.lock_outline_rounded,
                            text: "Сброс пароля",
                            press: () {},
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          ProfilePageButton(
                            width: double.infinity,
                            height: screenHeight * 0.075,
                            icon: Icons.question_mark_outlined,
                            text: "FAQ",
                            press: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const FAQPage()));
                            },
                          ),
                          SizedBox(height: screenHeight * 0.02),
                          ProfilePageButton(
                            width: double.infinity,
                            height: screenHeight * 0.075,
                            icon: Icons.chat_outlined,
                            text: "Группа поддержки",
                            press: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HelpPage()));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.03),
                  LogOutButton(
                    color: AppColor.redColor,
                    width: double.infinity,
                    height: screenHeight * 0.06,
                    text: "Выйти",
                    press: () {
                      logoutController.logout();
                    },
                    textWidth: screenWidth * 0.045,
                    textColor: AppColor.whiteColor,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
