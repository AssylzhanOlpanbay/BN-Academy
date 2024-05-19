import 'package:bn_academy_school/constants/app_color.dart';
import 'package:flutter/material.dart';

import 'faq_models.dart';

class FAQPage extends StatefulWidget {
  const FAQPage({super.key});

  @override
  State<FAQPage> createState() => _FAQPageState();
}

class _FAQPageState extends State<FAQPage> {
  final List<FAQ> faqs = getFaqs();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: screenHeight * 0.07, left: screenWidth * 0.05, right: screenWidth * 0.05),
          child: renderFaqs(),
        ),
      ),
    );
  }

  Widget renderFaqs() {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          faqs[index].isExpanded = !isExpanded;
        });
      },
      children: faqs.map<ExpansionPanel>((FAQ faq) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(faq.title),
            );
          }, 
          body: ListTile(
            title: Text(faq.body),
          ),
          isExpanded: faq.isExpanded,
        );
      }).toList(),
    );
  }
}