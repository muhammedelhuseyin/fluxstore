import 'package:flutter/material.dart';

import 'package:fluxstore/core/them/app_styles.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.title, required this.image, required this.containercolor, required this.circlecolor, this.right=1,
  });

  final String title ;
  final String image;
  final Color containercolor;
  final Color circlecolor;
  final double right ;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // الخلفية
        Container(
width: MediaQuery.of(context).size.width - 64, // 32 + 32
          height: 126,
          decoration: BoxDecoration(
            color: containercolor,
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        Positioned(
            top: 50,
            left: 30,
            child: Text(
              title,
              style: AppStyles.semibold16.copyWith(color: Colors.white),
            )),

        Positioned(
          right: 25,
          top: 17,
          child: Container(
            padding: EdgeInsets.all(15),
            height: 91,
            width: 91,
            decoration: BoxDecoration(
              color: circlecolor.withOpacity(0.50),
              shape: BoxShape.circle,
            ),
            child: Container(
              height: 61,
              width: 61,
              decoration: BoxDecoration(
                color: circlecolor.withOpacity(0.90),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ),
        Positioned(
            right: right,
            child: Image.asset(
              image,
              scale: 4,
            )),
      ],
    );
  }
}
