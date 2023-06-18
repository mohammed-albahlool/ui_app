import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.all(10),
      itemCount: 7,
      scrollDirection: Axis.vertical,
      physics: AlwaysScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 132 / 214 ,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: index % 2 == 0 ? Colors.pink.shade100 : Colors.blue.shade100,
        );
      },
    );
  }
}


/*
GridView(
           scrollDirection: Axis.vertical,
           padding: EdgeInsets.all(10),
           gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
             crossAxisCount: 2,
             crossAxisSpacing: 10,
             mainAxisSpacing: 10,

           ),
           children: [

             Card(
               elevation: 6,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
             ),

             Card(
               elevation: 6,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
             ),

             Card(
               elevation: 6,
               shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(10),
               ),
             ),
           ],
         ),
 */
