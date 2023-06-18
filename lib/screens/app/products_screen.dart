import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(itemBuilder: (context, index) {
      return ListTile(
        leading: Icon(Icons.qr_code_2),
        title: Text('Product Name $index'),
        subtitle: Text('Product info'),
        trailing: Icon(Icons.arrow_forward_ios,size: 18),
      );
    }, separatorBuilder: (context, index) {
      return Divider();
    }, itemCount: 10,);
  }
}








/*

ListView.builder(
        itemCount: 15,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(10),
        shrinkWrap: false,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Icon(Icons.qr_code_2),
            title: Text('Product Name $index'),
            subtitle: Text('Product info'),
            trailing: Icon(Icons.arrow_forward_ios,size: 18),
          );


      },),

 ListView(
        padding: EdgeInsets.all(10),
        reverse: false,
        scrollDirection: Axis.vertical,
        children: [
          ListTile(
            leading: Icon(Icons.qr_code_2),
            title: Text('Product Name 1'),
            subtitle: Text('Product info'),
            trailing: Icon(Icons.arrow_forward_ios,size: 18),
          ),
        ],
      ),
 */
