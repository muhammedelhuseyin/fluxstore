import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';

class BottomCategorySection extends StatelessWidget {
  const BottomCategorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 194,
      width: 332,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            height: 194,
            width: 166,
            decoration: BoxDecoration(
              color: AppColors.containerbg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Image.asset(AppImages.home13),
                Column(
                  spacing: 15,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      AppStrings.TShirts,
                      style: AppStyles.Regular13.copyWith(color: Color(0xff737680)),
                    ),
                    Text(
                      AppStrings.TheOfficeLife,
                      style: AppStyles.Regular17.copyWith(color: Color(0xff1D1F22)),
                    ),
                  ],
                )
              ],
            ),
          ),

          const Gap(10),

          Container(
            height: 194,
            width: 166,
            decoration: BoxDecoration(
              color: AppColors.containerbg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              spacing: 10,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    spacing: 15,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        AppStrings.TShirts,
                        style: AppStyles.Regular13.copyWith(color: Color(0xff737680)),
                      ),
                      Text(
                        AppStrings.TheOfficeLife,
                        style: AppStyles.Regular17.copyWith(color: Color(0xff1D1F22)),
                      ),
                    ],
                  ),
                ),
                Image.asset(AppImages.home14),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
