import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:fluxstore/home/models/products_model.dart';

class CategoriesSection extends StatefulWidget {
  const CategoriesSection({super.key});

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 30,
        children: List.generate(Categorie.categories.length, (index) {
          final product = Categorie.categories[index];
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedindex = index;
              });
              HapticFeedback.lightImpact();
            },
            child: Column(
              spacing: 7,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  height: 56,
                  width: 56,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: selectedindex == index
                        ? Border.all(color: Color(0xff3A2C27), width: 2)
                        : null,
                  ),
                  padding: EdgeInsets.all(5),
                  child: Container(
                    decoration: BoxDecoration(
                      color: selectedindex == index
                          ? AppColors.selectedBgColor
                          : AppColors.unselectedBgColor,
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      product.icon,
                      scale: 3.5,
                      color: selectedindex == index
                          ? AppColors.unselectedBgColor
                          : AppColors.selectedBgColor,
                    ),
                  ),
                ),
                Text(
                  product.title,
                  style: AppStyles.Regular12.copyWith(
                    color: selectedindex == index
                        ? AppColors.selectedBgColor
                        : Color(0xff9D9D9D),
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
