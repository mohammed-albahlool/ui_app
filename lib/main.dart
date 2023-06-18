import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_app/screens/app/bottom_navigation_screen.dart';
import 'package:ui_app/screens/app/categories_screen.dart';
import 'package:ui_app/screens/app/drawer/first_faqs_screen.dart';
import 'package:ui_app/screens/app/drawer/first_team_screen.dart';
import 'package:ui_app/screens/app/drawer/second_faqs_screen.dart';
import 'package:ui_app/screens/app/drawer/second_team_screen.dart';
import 'package:ui_app/screens/app/home_screen.dart';
import 'package:ui_app/screens/app/login_screen.dart';
import 'package:ui_app/screens/app/products_screen.dart';
import 'package:ui_app/screens/app/settings_screen.dart';
import 'package:ui_app/screens/core/launch_screen.dart';
import 'package:ui_app/screens/outboarding/out_boarding_screen.dart';

void main() => runApp(const MyApp());


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
       scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          backgroundColor: Colors.white,
          titleTextStyle: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 18,
          )
        ),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/launch_screen',
    routes: {
        '/launch_screen' : (context) => const LaunchScreen(),
        '/out_boarding_screen' : (context) => const OutBoardingScreen(),
      '/products_screen' : (context) => const ProductsScreen(),
      '/categories_screen' : (context) => const CategoriesScreen(),
      '/home_screen' : (context) => const HomeScreen(),
      '/bottom_navigation_screen' : (context) => const BottomNavigationScreen(),
      '/settings_screen' : (context) => const SettingsScreen(),
      '/login_screen' : (context) => const LoginScreen(),
      '/first_faqs_screen' : (context) => const FirstFaqsScreen(),
      '/second_faqs_screen' : (context) => const SecondFaqsScreen(),
      '/first_team_screen' : (context) => const FirstTeamScreen(),
      '/second_team_screen' : (context) => const SecondTeamScreen(),

    },
    );

  }
}
