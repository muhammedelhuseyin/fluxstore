import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class BannerSection extends StatelessWidget {
  const BannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: SizedBox(
        height: 168,
        width: 312,
        child: Stack(
          children: [
            Image.asset(AppImages.home1, fit: BoxFit.cover),
            Positioned(
              right: 10,
              child: Text(
                AppStrings.Autumn,
                style: AppStyles.semibold22.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
