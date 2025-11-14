// lib/screens/splash_screen.dart

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToOnboarding();
  }

  void _navigateToOnboarding() {
    Timer(
      const Duration(seconds: 3),
      () {
        if (mounted) {
            context.go('/onbording');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration:  BoxDecoration(
         // color: AppColors.black,
          image: DecorationImage(
           image: AssetImage(AppImages.splashBackground),
            fit: BoxFit.cover,
            opacity: 0.4,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            const SizedBox(height:200),
             Text(
              AppStrings.splashtitle,
              style: AppStyles.splashTitle.copyWith(color: Colors.white),
            ),

             Text(
              AppStrings.splashsubtitle,
              style: AppStyles.semibold20.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}