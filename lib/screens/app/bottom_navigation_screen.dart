import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_app/models/bn_item.dart';
import 'package:ui_app/screens/app/categories_screen.dart';
import 'package:ui_app/screens/app/home_screen.dart';
import 'package:ui_app/screens/app/products_screen.dart';
import 'package:ui_app/screens/app/settings_screen.dart';

class BottomNavigationScreen extends StatefulWidget {
  const BottomNavigationScreen({Key? key}) : super(key: key);

  @override
  State<BottomNavigationScreen> createState() => _BottomNavigationScreenState();
}

class _BottomNavigationScreenState extends State<BottomNavigationScreen> {

  int _currentIndex = 0;

  final List<BnItem> _item = <BnItem>[
    const BnItem("Home", HomeScreen()),
    const BnItem("Categories", CategoriesScreen()),
    const BnItem("Products", ProductsScreen()),
    const BnItem("Settings", SettingsScreen()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_item[_currentIndex].title),
      ),
      drawer: Drawer(
        child: Column(
          children:[
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(),
              currentAccountPictureSize: Size(75,75),
              accountName: Text('Username'),
              accountEmail: Text('email@app.com'),
              otherAccountsPictures: [
                CircleAvatar(),
                CircleAvatar(),
                CircleAvatar(),
              ],
              otherAccountsPicturesSize: Size(30,30),


            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/first_faqs_screen');
                });
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text("FAQs (1)",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
              subtitle: Text("Frequently Asked Q.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/second_faqs_screen');
                });
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text("FAQs (2)",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
              subtitle: Text("Frequently Asked Q.",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("Team (1)",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
              subtitle: Text("Team Members",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: (){
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/first_team_screen');
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.question_answer_outlined),
              title: Text("Team (2)",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
              subtitle: Text("Team Members",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 18,
              ),
              onTap: (){
                Navigator.pop(context);
                Future.delayed(const Duration(milliseconds: 500), () {
                  Navigator.pushNamed(context, '/second_team_screen');
                });
              },
            ),
            Divider(indent: 20, endIndent: 20),
            ListTile(
              onTap: (){
                Navigator.pop(context);
                Future.delayed(Duration(milliseconds: 500), () {
                  Navigator.pushReplacementNamed(context, '/login_screen');
                });
              },
              leading: Icon(Icons.question_answer_outlined),
              title: Text("Logout",
                style: GoogleFonts.poppins(
                  fontSize: 13,
                ),
              ),
              subtitle: Text("Return to login",
                style: GoogleFonts.poppins(
                  fontSize: 12,
                ),
              ),
            ),

          ],

        ),
      ),
      body: _item[_currentIndex].widget,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index){
         setState(() => _currentIndex = index);        },
        currentIndex: _currentIndex,
        //*****************************************
        showSelectedLabels: true,
        showUnselectedLabels: true,
        //*****************************************
        // fixedColor: Colors.pink,
        selectedItemColor: Colors.purple,
        selectedIconTheme: IconThemeData(
          color: Colors.grey.shade900,
        ),
        selectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.bold,
        ),
        selectedFontSize: 14,
        //*****************************************
        unselectedItemColor: Colors.grey.shade400,
        unselectedIconTheme: IconThemeData(
          color: Colors.grey.shade700,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w300,
        ),
        unselectedFontSize: 12,
        elevation: 10,
        //*****************************************
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.pink,
            icon: Icon(Icons.home_max_outlined),
            activeIcon: Icon(Icons.home),
            label: "Home",
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.green,
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: "Categories",
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.yellow,
              icon: Icon(Icons.qr_code_2_outlined),
              activeIcon: Icon(Icons.qr_code),
              label: 'Products'
          ),
          BottomNavigationBarItem(
              backgroundColor: Colors.red,
              icon: Icon(Icons.settings_outlined),
              activeIcon: Icon(Icons.settings),
              label: 'Products'
          ),

        ],
      ),
    );
  }
}
