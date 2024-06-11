// import 'package:bn_academy_school/components/button.dart';
// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'dart:io';

// class EditProfilePage extends StatefulWidget {
//   const EditProfilePage({super.key});

//   @override
//   State<EditProfilePage> createState() => _EditProfilePageState();
// }

// class _EditProfilePageState extends State<EditProfilePage> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   String? profileImagePath;

//   @override
//   void initState() {
//     super.initState();
//     _loadUserData();
//   }

//   Future<void> _loadUserData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       nameController.text = prefs.getString('fullName') ?? '';
//       emailController.text = prefs.getString('email') ?? '';
//       profileImagePath = prefs.getString('profileImagePath');
//     });
//   }

//   Future<void> _saveUserData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('fullName', nameController.text);
//     await prefs.setString('email', emailController.text);
//     if (profileImagePath != null) {
//       await prefs.setString('profileImagePath', profileImagePath!);
//     }
//   }

//   Future<void> _pickImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);

//     if (image != null) {
//       setState(() {
//         profileImagePath = image.path;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColor.backgroundColor,
//       body: Container(
//         margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, size: screenWidth * 0.07)),
//                   Text("Мой аккаунт", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
//                 ],
//               ),
//               SizedBox(height: screenHeight * 0.03),
//               Stack(
//                 children: [
//                   CircleAvatar(
//                     radius: 70,
//                     backgroundImage: profileImagePath != null ? FileImage(File(profileImagePath!)) : null,
//                     child: profileImagePath == null ? Icon(Icons.person, size: 70) : null,
//                   ),
//                   Positioned(
//                     bottom: 0,
//                     right: 0,
//                     child: Container(
//                       width: screenHeight * 0.045,
//                       height: screenHeight * 0.045,
//                       decoration: BoxDecoration(
//                         color: AppColor.editPhotoIconButtonColor,
//                         borderRadius: BorderRadius.circular(50),
//                       ),
//                       child: IconButton(
//                         onPressed: _pickImage,
//                         icon: Icon(Icons.edit_outlined, color: AppColor.whiteColor, size: screenWidth * 0.06),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//               SizedBox(height: screenHeight * 0.07),
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColor.whiteColor,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: AppColor.textFormFieldBorderColor),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
//                   child: TextFormField(
//                     controller: nameController,
//                     style: TextStyle(fontSize: screenWidth * 0.045),
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.person),
//                       border: InputBorder.none,
//                       hintText: "Имя",
//                       hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.02),
//               Container(
//                 decoration: BoxDecoration(
//                   color: AppColor.whiteColor,
//                   borderRadius: BorderRadius.circular(10),
//                   border: Border.all(color: AppColor.textFormFieldBorderColor),
//                 ),
//                 child: Container(
//                   padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
//                   child: TextFormField(
//                     controller: emailController,
//                     style: TextStyle(fontSize: screenWidth * 0.045),
//                     decoration: InputDecoration(
//                       prefixIcon: const Icon(Icons.email),
//                       border: InputBorder.none,
//                       hintText: "Email",
//                       hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: screenHeight * 0.07),
//               Button(
//                 color: AppColor.mainColor,
//                 width: double.infinity,
//                 height: screenHeight * 0.06,
//                 text: "Редактировать профиль",
//                 press: () async {
//                   await _saveUserData();
//                   Navigator.pop(context);
//                 },
//                 textWidth: screenWidth * 0.04,
//                 textColor: AppColor.whiteColor,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:bn_academy_school/components/button.dart';
import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/profile/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String? profileImagePath;

  final ProfileController profileController = Get.find<ProfileController>();

  @override
  void initState() {
    super.initState();
    nameController.text = profileController.name.value;
    emailController.text = profileController.email.value;
    profileImagePath = profileController.profileImagePath.value;
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        profileImagePath = image.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Container(
        margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(onPressed: () => Navigator.pop(context), icon: Icon(Icons.arrow_back, size: screenWidth * 0.07)),
                  Text("Мой аккаунт", style: TextStyle(fontSize: screenWidth * 0.06, fontWeight: FontWeight.bold)),
                ],
              ),
              SizedBox(height: screenHeight * 0.03),
              Stack(
                children: [
                  CircleAvatar(
                    radius: 70,
                    backgroundImage: profileImagePath != null ? FileImage(File(profileImagePath!)) : null,
                    child: profileImagePath == null ? Icon(Icons.person, size: 70) : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: screenHeight * 0.045,
                      height: screenHeight * 0.045,
                      decoration: BoxDecoration(
                        color: AppColor.editPhotoIconButtonColor,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: IconButton(
                        onPressed: _pickImage,
                        icon: Icon(Icons.edit_outlined, color: AppColor.whiteColor, size: screenWidth * 0.06),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.textFormFieldBorderColor),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
                  child: TextFormField(
                    controller: nameController,
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.person),
                      border: InputBorder.none,
                      hintText: "Имя",
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColor.textFormFieldBorderColor),
                ),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
                  child: TextFormField(
                    controller: emailController,
                    style: TextStyle(fontSize: screenWidth * 0.045),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.email),
                      border: InputBorder.none,
                      hintText: "Email",
                      hintStyle: TextStyle(fontSize: screenWidth * 0.04, fontFamily: "TTNormsPro"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.07),
              Button(
                color: AppColor.mainColor,
                width: double.infinity,
                height: screenHeight * 0.06,
                text: "Редактировать профиль",
                press: () async {
                  await profileController.saveUserInfo(
                    nameController.text,
                    emailController.text,
                    profileImagePath,
                  );
                  Navigator.pop(context);
                },
                textWidth: screenWidth * 0.04,
                textColor: AppColor.whiteColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

