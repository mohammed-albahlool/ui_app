import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppPage extends StatelessWidget {
  const AppPage({
    Key? key,
    required this.image,
    required this.title,
    required this.content,

  }) : super(key: key);

  final String image ;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('images/$image.jpeg' , height: 300,),
        const SizedBox(height: 36,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                  color: const Color(0xFF23203F),
                ),
              ),
              const SizedBox(height: 21,),
              Text(
                content,
                textAlign: TextAlign.center,
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 17,
                  color: const Color(0xFF716F87),
                ),

              ),
            ],
          ),
        ),
      ],
    );
  }
}