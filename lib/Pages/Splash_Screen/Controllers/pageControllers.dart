import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_green/Core/Constant/theme/app_colors.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/splash_screen_one.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/splash_screen_three.dart';
import 'package:go_green/Pages/Splash_Screen/Screens/splash_screen_two.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Pagecontrollers extends StatefulWidget {
  const Pagecontrollers({super.key});

  @override
  State<Pagecontrollers> createState() => _PagecontrollersState();
}

class _PagecontrollersState extends State<Pagecontrollers> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<Widget> _pages = <Widget>[
    const SplashScreenOne(),
    const SplashScreenTwo(),
    const SplashScreenThree(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (int page) {
          setState(() {
            _currentPage = page;
          });
        },
        children: _pages,
      ),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBottomBar() {
    //check if the current page is the last page (not login page)
    if (_currentPage < _pages.length) {
      return Container(
        padding: const EdgeInsets.all(35),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SmoothPageIndicator(
              controller: _pageController,
              count: _pages.length,
              effect: const WormEffect(
                dotColor: Colors.grey,
                activeDotColor: AppColors.primaryColor, // Customize as needed
                dotHeight: 10.0,
                dotWidth: 14.0,
                spacing: 8.0,
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //if its the last page show the login button
                if (_currentPage == _pages.length - 1)
                  ElevatedButton(
                    onPressed: () {
                      //navigate to the login page
                      // Navigator.pushReplacementNamed(context, '/login');
                    },
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 130.w, vertical: 9.h),
                        child: const Text('Get Started')),
                  )
              ],
            )
          ],
        ),
      );
    } else {
      return const SizedBox.shrink();
    }
  }
}
