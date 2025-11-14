import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';

class TopCollectionSection extends StatelessWidget {
  const TopCollectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // ---- First Card ----
        Stack(
          children: [
            Container(
              height: 141,
              width: 312,
              decoration: BoxDecoration(
                color: AppColors.containerbg,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 25,
              left: 55,
              child: Text(
                AppStrings.Saleupto,
                style: AppStyles.Regular12.copyWith(color: Color(0xff777E90)),
              ),
            ),
            Positioned(
              top: 45,
              left: 55,
              child: Text(
                AppStrings.FORSLIMBEAUTY,
                style: AppStyles.Regular20.copyWith(
                    color: Color(0xff777E90)),
              ),
            ),
            Positioned(
              top: 25,
              right: 35,
              child: CircleAvatar(
                radius: 45,
                child: Image.asset(AppImages.home7),
              ),
            ),
            Positioned(
              right: 0,
              child: Image.asset(
                AppImages.home11,
                scale: 4,
              ),
            ),
          ],
        ),

        const Gap(10),

        // ---- Second Card ----
        Stack(
          children: [
            Container(
              height: 210,
              width: 312,
              decoration: BoxDecoration(
                color: AppColors.containerbg,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            Positioned(
              top: 50,
              left: 35,
              child: Text(
                AppStrings.SummerCollection2021,
                style: AppStyles.Regular12.copyWith(color: Color(0xff777E90)),
              ),
            ),
            Positioned(
              top: 75,
              left: 35,
              child: Text(
                AppStrings.Mostsexyfabulousdesign,
                style: AppStyles.Regular20.copyWith(
                  color: Color(0xff353945),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: 50,
              right: 35,
              child: CircleAvatar(
                radius: 50,
                child: Image.asset(AppImages.home6),
              ),
            ),
            Positioned(
              right: 0,
              child: Image.asset(
                AppImages.home12,
                scale: 4,
              ),
            ),
          ],
        ),

      ],
    );
  }
}
