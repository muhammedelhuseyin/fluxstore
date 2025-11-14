import 'package:flutter/material.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:fluxstore/home/Widgets/section_header.dart';
import 'package:fluxstore/home/models/products_model.dart';
import 'package:gap/gap.dart';

class RecommendedSection extends StatelessWidget {
  const RecommendedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          Title: "Recommended",
          actionText: "Show all",
        ),
        const Gap(25),
        SizedBox(
          height: 66,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ProductsModel.Recommended.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) {
              final product = ProductsModel.Recommended[index];
              return Container(
                margin: const EdgeInsets.only(right: 15),
                height: 66,
                width: 213,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.15),
                      offset: const Offset(0, 3),
                      blurRadius: 10,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: Row(
                  spacing: 5,
                  children: [
                    Image.asset(product.image),
                    Column(
                      spacing: 3,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          product.title,
                          style: AppStyles.Regular14.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "\$ ${product.price}",
                          style: AppStyles.semibold16,
                        ),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
