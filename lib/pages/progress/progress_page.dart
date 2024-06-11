import 'dart:io';

import 'package:bn_academy_school/constants/app_color.dart';
import 'package:bn_academy_school/pages/profile/profile_controller.dart';
import 'package:bn_academy_school/pages/progress/test_result_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:table_calendar/table_calendar.dart';

class ProgressPage extends StatefulWidget {
  ProgressPage({super.key});

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final ProfileController profileController = Get.put(ProfileController());
  DateTime today = DateTime.now();

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
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text("Прогресс", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold),),
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
                SizedBox(height: screenHeight * 0.03),
                Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset("assets/images/progress_icon.png", width: screenWidth * 0.2, fit: BoxFit.contain,),
                    SizedBox(height: screenHeight * 0.02),
                    Text("8", style: TextStyle(fontSize: screenWidth * 0.12, fontFamily: "TTNormsPro", color: AppColor.mainColor, fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
                    Text("дней подряд", style: TextStyle(fontSize: screenWidth * 0.05, height: 0.7, fontFamily: "TTNormsPro"), textAlign: TextAlign.center,),
                  ],
                )
              ),
              SizedBox(height: screenHeight * 0.05),
              Container(
                width: double.infinity,
                height: screenHeight * 0.12,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Дни", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                          Text("4", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),)
                        ],
                      ),
                      const Spacer(),
                      const VerticalDivider(color: AppColor.textFormFieldBorderColor,),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Уроки", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                          Text("12", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),)
                        ],
                      ),
                      const Spacer(),
                      const VerticalDivider(color: AppColor.textFormFieldBorderColor,),
                      const Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Минуты", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),),
                          Text("320", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro"),)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColor.whiteColor,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
                  child: TableCalendar(
                    focusedDay: today, 
                    firstDay: DateTime(2010, 01, 01), 
                    lastDay: DateTime(2030, 01, 01)
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.03),
              Text("Изученные уроки", style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w500),),
              SizedBox(height: screenHeight * 0.05),
              TestResultCard(),
              ],
            ),
          ),
        ),
      );
      }
  }
    );
  }
}




// import 'dart:io';

// import 'package:bn_academy_school/constants/app_color.dart';
// import 'package:bn_academy_school/pages/progress/event.dart';
// import 'package:bn_academy_school/pages/progress/test_result_card.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';
// import 'package:percent_indicator/linear_percent_indicator.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:table_calendar/table_calendar.dart';

// class ProgressPage extends StatefulWidget {
//   const ProgressPage({super.key});

//   @override
//   State<ProgressPage> createState() => _ProgressPageState();
// }

// class _ProgressPageState extends State<ProgressPage> {
//   DateTime today = DateTime.now();
//   CalendarFormat _calendarFormat = CalendarFormat.month;
//   DateTime _focusedDay = DateTime.now();
//   DateTime? _selectedDay;
//   Map<DateTime, List<Event>> events = {};
//   TextEditingController eventController = TextEditingController();
//   late final ValueNotifier<List<Event>> _selectedEvents;

//   @override
//   void initState() {
//     super.initState();
//     _selectedDay = _focusedDay;
//     _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay!));
//   }

//   @override
//   void dispose() {
//     eventController.dispose();
//     _selectedEvents.dispose();
//     super.dispose();
//   }

//   void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
//     if (!isSameDay(_selectedDay, selectedDay)) {
//       setState(() {
//         _selectedDay = selectedDay;
//         _focusedDay = focusedDay;
//         _selectedEvents.value = _getEventsForDay(selectedDay);
//       });
//     }
//   }

//   List<Event> _getEventsForDay(DateTime day) {
//     return events[day] ?? [];
//   }

//   Future<Map<String, String>> getUserInfo() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     String savedName = prefs.getString('name') ?? '';
//     String savedEmail = prefs.getString('email') ?? '';
//     String profileImagePath = prefs.getString('profileImagePath') ?? '';
//     return {'name': savedName, 'email': savedEmail, 'profileImagePath': profileImagePath};
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
//           String profileImagePath = snapshot.data?['profileImagePath'] ?? '';

//           return Scaffold(
//             backgroundColor: AppColor.backgroundColor,
//             floatingActionButton: FloatingActionButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       scrollable: true,
//                       title: Text("Название"),
//                       content: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05, vertical: screenHeight * 0.05),
//                         child: TextField(
//                           controller: eventController,
//                         ),
//                       ),
//                       actions: [
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               events[_selectedDay!] = [Event(eventController.text)];
//                               _selectedEvents.value = _getEventsForDay(_selectedDay!);
//                             });
//                             Navigator.of(context).pop();
//                             _selectedEvents.value = _getEventsForDay(_selectedDay!);
//                           },
//                           child: Text("Сохранить"),
//                         )
//                       ],
//                     );
//                   },
//                 );
//               },
//               child: Icon(Icons.add),
//               foregroundColor: AppColor.whiteColor,
//               backgroundColor: AppColor.mainColor,
//             ),
//             body: SingleChildScrollView(
//               child: Container(
//                 margin: EdgeInsets.only(top: screenHeight * 0.05, left: screenWidth * 0.05, right: screenWidth * 0.05),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Row(
//                       children: [
//                         Text("Прогресс", style: TextStyle(fontSize: screenWidth * 0.07, fontFamily: "TTNormsPro", fontWeight: FontWeight.bold)),
//                         const Spacer(),
//                         CircleAvatar(
//                           backgroundImage: profileImagePath.isNotEmpty ? FileImage(File(profileImagePath)) : null,
//                           child: profileImagePath.isEmpty ? Icon(Icons.person, size: screenWidth * 0.07) : null,
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: screenHeight * 0.03),
//                     Center(
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Image.asset("assets/images/progress_icon.png", width: screenWidth * 0.2, fit: BoxFit.contain),
//                           SizedBox(height: screenHeight * 0.02),
//                           Text(
//                             "8",
//                             style: TextStyle(fontSize: screenWidth * 0.12, fontFamily: "TTNormsPro", color: AppColor.mainColor, fontWeight: FontWeight.bold),
//                             textAlign: TextAlign.center,
//                           ),
//                           Text(
//                             "дней подряд",
//                             style: TextStyle(fontSize: screenWidth * 0.05, height: 0.7, fontFamily: "TTNormsPro"),
//                             textAlign: TextAlign.center,
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.05),
//                     Container(
//                       width: double.infinity,
//                       height: screenHeight * 0.12,
//                       decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10)),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.07),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Дни", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro")),
//                                 Text("4", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro")),
//                               ],
//                             ),
//                             const Spacer(),
//                             const VerticalDivider(color: AppColor.textFormFieldBorderColor),
//                             const Spacer(),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Уроки", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro")),
//                                 Text("12", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro")),
//                               ],
//                             ),
//                             const Spacer(),
//                             const VerticalDivider(color: AppColor.textFormFieldBorderColor),
//                             const Spacer(),
//                             Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Text("Минуты", style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro")),
//                                 Text("320", style: TextStyle(fontSize: screenWidth * 0.07, fontWeight: FontWeight.w500, fontFamily: "TTNormsPro")),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(color: AppColor.whiteColor, borderRadius: BorderRadius.circular(10)),
//                       child: Container(
//                         margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
//                         child: SizedBox(
//                           height: screenHeight * 0.41,
//                           child: TableCalendar(
//                             focusedDay: _focusedDay,
//                             firstDay: DateTime(2010, 01, 01),
//                             lastDay: DateTime(2030, 01, 01),
//                             selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
//                             calendarFormat: _calendarFormat,
//                             startingDayOfWeek: StartingDayOfWeek.monday,
//                             onDaySelected: _onDaySelected,
//                             eventLoader: _getEventsForDay,
//                             calendarStyle: CalendarStyle(outsideDaysVisible: false),
//                             onFormatChanged: (format) {
//                               if (_calendarFormat != CalendarFormat.month) {
//                                 setState(() {
//                                   _calendarFormat = CalendarFormat.month;
//                                 });
//                               }
//                             },
//                             onPageChanged: (focusedDay) {
//                               _focusedDay = focusedDay;
//                             },
//                           ),
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.03),
//                     Text("Планы", style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w500)),
//                     ValueListenableBuilder<List<Event>>(
//                       valueListenable: _selectedEvents,
//                       builder: (context, value, _) {
//                         return SizedBox(
//                           height: screenHeight * 0.2,
//                           child: ListView.builder(
//                             itemCount: value.length,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 margin: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//                                 decoration: BoxDecoration(
//                                   border: Border.all(),
//                                   borderRadius: BorderRadius.circular(12),
//                                 ),
//                                 child: ListTile(
//                                   onTap: () => print(""),
//                                   title: Text(value[index].toString()),
//                                 ),
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     ),
//                     Text("Изученные уроки", style: TextStyle(fontSize: screenWidth * 0.05, fontWeight: FontWeight.w500)),
//                     SizedBox(height: screenHeight * 0.05),
//                     TestResultCard(),
//                     SizedBox(height: screenHeight * 0.01),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         }
//       },
//     );
//   }
// }