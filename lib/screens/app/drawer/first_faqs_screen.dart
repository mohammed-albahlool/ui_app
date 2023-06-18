import 'package:flutter/material.dart';
import 'package:ui_app/models/faq.dart';
import 'package:google_fonts/google_fonts.dart';

class FirstFaqsScreen extends StatefulWidget {
  const FirstFaqsScreen({Key? key}) : super(key: key);

  @override
  State<FirstFaqsScreen> createState() => _FirstFaqsScreenState();
}

class _FirstFaqsScreenState extends State<FirstFaqsScreen> {

  List<Faq> _faq = <Faq>[
    Faq('Question #1' ,"Answer #1"),
    Faq('Question #2' ,"Answer #2"),
    Faq('Question #3' ,"Answer #3"),
    Faq('Question #4' ,"Answer #4"),
    Faq('Question #5' ,"Answer #5"),
  ];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('FAQs (1)'),
      ),
      body: SingleChildScrollView(
        child: ExpansionPanelList(
          elevation: 6,
          expandedHeaderPadding: EdgeInsets.all(10),
          animationDuration: Duration(milliseconds: 1),
          dividerColor: Colors.blue.shade100,
          expansionCallback: (panelIndex, isExpanded) {
            setState(() => _faq[panelIndex].isExpanded = !isExpanded);
          },
          children: _faq
              .map(
                  (faq) => ExpansionPanel(
                    backgroundColor: Colors.white,
                    headerBuilder: (context, isExpanded) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        faq.question,
                        style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    );
                  },
                    body: Container(
                      color: Colors.red,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.symmetric(horizontal: 10 , vertical: 5),
                      child: Text(
                        faq.answer,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                      isExpanded: faq.isExpanded,
                    canTapOnHeader: true,
                  ),
                )
                .toList(),
        ),
      ),


    );
  }
}
