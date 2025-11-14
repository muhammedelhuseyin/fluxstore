import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';

class SocialMediaIcons extends StatelessWidget {
  const SocialMediaIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Color(0xffD9D9D9)),
          ),
          child: Image.asset(AppImages.apple_icon, scale: 3.7),
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Color(0xffD9D9D9)),
          ),
          child: Image.asset(AppImages.google_icon, scale: 3.7),
        ),
        Container(
          margin: EdgeInsets.only(right: 20),
          height: 45,
          width: 45,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 2, color: Color(0xffD9D9D9)),
          ),
          child: Image.asset(AppImages.facebook_icon, scale: 3.7),
        ),
      ],
    );
  }
}
