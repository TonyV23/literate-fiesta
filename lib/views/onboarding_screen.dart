import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pablo/controllers/auth_controller.dart';
import 'package:pablo/utils/app_textstyles.dart';
import 'package:pablo/views/signin_screen.dart';

class OnboardingScreen extends StatefulWidget {
    const OnboardingScreen({super.key});

    @override
    State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

    final PageController _pageController = PageController();
    int _currentPage = 0;

    final List<OnBoardingItem> _items = [
        OnBoardingItem(
            description: 'Explore the newest fashion trends and find your unique style',
            title: 'Discover Latest Trends',
            image: 'assets/images/intro.png'
        ),
        OnBoardingItem(
            description: 'Shop premium quality products from top brands worldwide',
            title: 'Quality products',
            image: 'assets/images/intro1.png'
        ),
        OnBoardingItem(
            description: 'Simple and secure shopping experience at your fingertips',
            title: 'Easy Shopping',
            image: 'assets/images/intro2.png'
        )
    ];

    // handle get started button pressed
    void _handleGetStarted() {
        final AuthController authController = Get.find<AuthController>();
        authController.setFirstTimeDone();
        Get.off(() => SigninScreen());
    }

    @override
    Widget build(BuildContext context) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
            body: Stack(
                children: [
                    PageView.builder(
                        controller: _pageController,
                        itemCount: _items.length,
                        onPageChanged: (index) {
                            setState(() {
                                    _currentPage = index;
                                });
                        },
                        itemBuilder: (context, index) {
                            return Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Image.asset(_items[index].image, height: MediaQuery.of(context).size.height * 0.4,),
                                    const SizedBox(height: 40),
                                    Text(_items[index].title,
                                        textAlign: TextAlign.center, 
                                        style: AppTextstyles.withColor(AppTextstyles.h1, Theme.of(context).textTheme.bodyLarge!.color!),),
                                    const SizedBox(height: 16,),
                                    Padding(padding: EdgeInsets.symmetric(horizontal: 32),
                                        child: Text(_items[index].description, textAlign: TextAlign.center,
                                            style: AppTextstyles.withColor(AppTextstyles.bodLarge,
                                                isDark ? Colors.grey[400]! : Colors.grey[600]!,))),

                                ]
                            );
                        }),

                    // bottom
                    Positioned(bottom: 80, left: 0, right: 0, child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(_items.length,
                                (index) => AnimatedContainer(duration: Duration(microseconds: 300),
                                    margin: EdgeInsets.symmetric(horizontal: 4),
                                    height: 8,
                                    width: _currentPage == index ? 24 : 8,
                                    decoration: BoxDecoration(
                                        color: _currentPage == index ? Theme.of(context).primaryColor
                                            : (isDark ? Colors.grey[700] : Colors.grey[300]),
                                        borderRadius: BorderRadius.circular(4)
                                    ),
                                )),
                        )),

                    Positioned(
                        bottom: 16,
                        left: 16,
                        right: 16,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                                TextButton(
                                    onPressed: () {
                                        _handleGetStarted();
                                    },
                                    child: Text('Skip',
                                        style: AppTextstyles.withColor(AppTextstyles.buttonMedium, isDark ? Colors.grey[400]! : Colors.grey[600]!),
                                    )),
                                ElevatedButton(
                                    onPressed: () {
                                        if (_currentPage < _items.length - 1) {
                                            _pageController.nextPage(duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
                                        } else {
                                            _handleGetStarted();
                                        }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Theme.of(context).primaryColor,
                                        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(12),
                                        )),
                                    child: Text(_currentPage < _items.length - 1 ? 'Next' : 'Get Started',
                                        style: AppTextstyles.withColor(AppTextstyles.buttonMedium, Colors.white))
                                ),
                            ],))
                ],
            ),
        );
    }
}


class OnBoardingItem {
    final String image;
    final String title;
    final String description;

    OnBoardingItem({required this.title, required this.description, required this.image});


}