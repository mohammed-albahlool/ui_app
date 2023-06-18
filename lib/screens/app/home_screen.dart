import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      padding: EdgeInsets.all(15),
      children: [
        Text('Categories' ,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 100,
          ),
          child: GridView.builder(
            itemCount: 10,
            scrollDirection: Axis.horizontal,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                mainAxisSpacing: 10
            ),
            itemBuilder: (context, index) {
              return Container(
                color: Colors.grey,
              );
            },),
          // child: ListView.builder(
          //   itemCount: 10,
          //   scrollDirection: Axis.horizontal,
          //   itemBuilder: (context, index) {
          //     return Container(
          //       height: 100,
          //       width: 100,
          //       color: Colors.grey,
          //       margin: EdgeInsetsDirectional.only(end: 10),
          //     );
          // },),
        ),
        SizedBox(height: 20),
        Text('Favorite Products' ,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 20),
        GridView.builder(
          scrollDirection: Axis.vertical,
          itemCount: 4,
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,

          ),
          itemBuilder: (context, index) {
            return Container(
              color: index % 2 ==0 ? Colors.pink.shade100 : Colors.blue.shade100,
            );
          },),
        SizedBox(height: 20),
        Text('Products' ,
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        SizedBox(height: 10),
        ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: 5,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder:  (context, index) {
            return Container(
              height: 100,
              margin: EdgeInsetsDirectional.only(bottom: 10),
              color: index % 2 == 0
                  ? Colors.pink.shade100
                  : Colors.blue.shade100,
            );
          },
        ),





      ],
    );
  }
}
