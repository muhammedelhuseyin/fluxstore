import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';

class NewCollectionSection extends StatelessWidget {
  const NewCollectionSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 110,
          width: 424, // نفس ما كانت
          decoration: BoxDecoration(
            color: AppColors.containerbg,
          ),
        ),

        Positioned(
          top: 25,
          left: 55,
          child: Text(
            AppStrings.NEWCOLLECTION,
            style: AppStyles.Regular12.copyWith(color: Color(0xff777E90)),
          ),
        ),

        Positioned(
          top: 45,
          left: 55,
          child: Text(
            AppStrings.HANGOUTPARTY,
            style: AppStyles.Regular20.copyWith(color: Color(0xff353945)),
          ),
        ),

        // دائرة الخلفية
        Positioned(
          top: 6,
          right: 30,
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Color(0xffE2E2E2),
          ),
        ),

        // الصورة فوق الدائرة
        Positioned(
          top: 6,
          right: 30,
          child: Image.asset(
            AppImages.home8,
            scale: 6,
          ),
        ),
      ],
    );
  }
}
