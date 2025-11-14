import 'package:flutter/material.dart';
import 'package:fluxstore/Onboarding/Models/onboarding_model.dart';
import 'package:fluxstore/Onboarding/widgets/onboarding_page.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الـ PageView
          PageView.builder(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount:OnboardingModel.page.length ,
            itemBuilder: (BuildContext context, int index) { 
              final page =OnboardingModel.page[index];
              return  OnboardingPage(
                image: page.image,
                title: page.title,
                subtitle: page.subtitle,
              );
             },
          
            
          ),

          // الـ Dots Indicator
          Positioned(
            bottom: 160,
            left: 0,
            right: 0,
            child: Center(
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.white.withOpacity(0.3),
                  activeDotColor: Colors.white,
                  dotHeight: 8,
                  dotWidth: 8,
                  spacing: 8,
                ),
              ),
            ),
          ),

          // الزر
          Positioned(
            bottom: 80,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                width: 280,
                height: 56,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextButton(
                  onPressed: () {
                    if (_currentPage < OnboardingModel.page.length - 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      // اذهب للصفحة الرئيسية
                     // Navigator.pushReplacementNamed(context, '/home');
                     context.go('/signup');

                    }
                  },
                  child: Text(    _currentPage < OnboardingModel.page.length - 1 
                        ? 'Next' 
                        : 'Shopping now',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
