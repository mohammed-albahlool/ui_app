import 'package:flutter/material.dart';
import 'package:ui_app/models/faq.dart';
import 'package:google_fonts/google_fonts.dart';

class SecondFaqsScreen extends StatefulWidget {
  const SecondFaqsScreen({Key? key}) : super(key: key);

  @override
  State<SecondFaqsScreen> createState() => _SecondFaqsScreenState();
}
class _SecondFaqsScreenState extends State<SecondFaqsScreen> {

  List<Faq> _faq = <Faq>[
    Faq('Question #1' ,"Answer #1"),
    Faq('Question #2' ,"Answer #2"),
    Faq('Question #3' ,"Answer #3"),
    Faq('Question #4' ,"Answer #4"),
    Faq('Question #5' ,"Answer #5"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FAQs (2)'),
      ),
      body: ListView.builder(
        itemCount: _faq.length,
        itemBuilder: (context, index) {
          return ExpansionTile(
            //***************************************************
            collapsedBackgroundColor: Colors.grey.shade100,
            collapsedIconColor: Colors.blue.shade800,
            collapsedTextColor: Colors.blue.shade800,
            //***************************************************
            textColor: Colors.black45,
            iconColor: Colors.black45,
            backgroundColor: Colors.grey.shade100,
            //***************************************************
            expandedAlignment: Alignment.centerLeft,
            childrenPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            onExpansionChanged: (value) {
              print(value);
            },
            //***************************************************
            leading: Icon(Icons.question_answer,size: 18),
            title: Text(
              _faq[index].question,
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
          children: [
            Text(_faq[index].answer),
          ],
          );
        },
      ));
  }
}
