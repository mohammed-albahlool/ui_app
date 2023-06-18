import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_app/Widget/app_page.dart';

import '../../Widget/custom_indicator.dart';


class OutBoardingScreen extends StatefulWidget {
  const OutBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OutBoardingScreen> createState() => _OutBoardingScreenState();
}

class _OutBoardingScreenState extends State<OutBoardingScreen> {

  int _currentPage = 0 ;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }


  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Align(
              alignment: AlignmentDirectional.centerEnd ,
              child: Visibility(
                visible: _currentPage < 2 ,
                replacement: TextButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, '/login_screen');

                }, child: const Text('START'),
                ),
                child: TextButton(onPressed: (){
                  _pageController.animateToPage(2,
                      duration: const Duration(seconds: 1),
                      curve: Curves.easeOutBack);
                },
                  child: const Text('SKIP'),
                ),
              ),
            ),
            Expanded(
              child: PageView(
                physics: const BouncingScrollPhysics() ,
                controller: _pageController,

                onPageChanged: (int value){
                  setState(() => _currentPage = value);
                },
                scrollDirection: Axis.horizontal,
                children: const [
                AppPage(
                    image: 'image',
                    title: 'Welcome',
                    content: 'Now were up in the big leagues gettingour turn at bat. The Bardy thats the way we Bardy Bunch..'
                ),

                  AppPage(
                      image: 'image',
                      title: 'Add to cart',
                      content: 'Now were up in the big leagues gettingour turn at bat. The Bardy thats the way we Bardy Bunch..'
                  ),

                  AppPage(
                      image: 'image',
                      title: 'Enjoy Purchase! ',
                      content: 'Now were up in the big leagues gettingour turn at bat. The Bardy thats the way we Bardy Bunch..'
                  ),
                ],
              ),
            ),

            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TabPageSelectorIndicator(
            //         backgroundColor: _currentPage == 0 ? Colors.orange : Colors.transparent,
            //         borderColor: Colors.blue,
            //         size: 10
            //     ),
            //     TabPageSelectorIndicator(
            //         backgroundColor: _currentPage == 1 ? Colors.orange : Colors.transparent,
            //         borderColor: Colors.blue,
            //         size: 10
            //     ),
            //     TabPageSelectorIndicator(
            //         backgroundColor: _currentPage == 2 ? Colors.orange : Colors.transparent,
            //         borderColor: Colors.blue,
            //         size: 10
            //     ),
            //   ],
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndicator(seleted: _currentPage == 0 , marginEnd: 10,),
                CustomIndicator(seleted: _currentPage == 1 , marginEnd: 10,),
                CustomIndicator(seleted: _currentPage == 2),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(onPressed: (){
                  if(_currentPage > 0){
                    _pageController.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeOutBack,);

                  }
                },
                  icon: const Icon(Icons.arrow_back_ios),
                color: _currentPage == 0 ? Colors.grey : Colors.black,
                ),

                IconButton(onPressed: (){
                  if(_currentPage < 2){
                    _pageController.nextPage(duration: const Duration(seconds: 1), curve: Curves.easeOutBack,);

                  }
                },
                  icon: const Icon(Icons.arrow_forward_ios),
                  color: _currentPage == 2 ? Colors.grey : Colors.black,
                ),
              ],
            ),
            const SizedBox(height: 20),
            Visibility(
              visible: _currentPage ==2,
              maintainState: true,
              maintainSize: true,
              maintainAnimation: true,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: ElevatedButton(onPressed: (){
                  Navigator.pushReplacementNamed(context, '/login_screen');
                },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade800,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),

                  child: Text('START',
                    style: GoogleFonts.tajawal(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 2,
                    ),
                ),
                ),
              ),
            ),
            const SizedBox(height: 50),

          ],
        ),
      ),
    );
  }
}






