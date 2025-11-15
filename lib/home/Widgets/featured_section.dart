import 'package:flutter/material.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:fluxstore/home/Widgets/section_header.dart';
import 'package:fluxstore/home/models/products_model.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class FeaturedSection extends StatelessWidget {
  const FeaturedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionHeader(
          Title: "Feature Products",
          actionText: "Show all",
        ),
        Gap(20),
        SizedBox(
          height: 227,
         child: ListView.builder(
  scrollDirection: Axis.horizontal,
  padding: const EdgeInsets.symmetric(horizontal: 16),
  itemCount: ProductsModel.homeproduct.length,
  itemBuilder: (context, index) {
    final product = ProductsModel.homeproduct[index];

    return GestureDetector(
      onTap: () {
        context.pushNamed(
          'productDetails',
          extra: product,   // 👈 نرسل مودل المنتج كامل
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 12),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(color: Color(0xffF4F4F4)),
                height: 172,
                width: 126,
                child: Hero(tag: product.id,
                child: Image.asset(product.images[0])),
              ),
              const Gap(14),
              Text(
                product.title,
                style: AppStyles.Regular14,
              ),
              const Gap(2),
              Text(
                "\$ ${product.price}",
                style: AppStyles.semibold16,
              ),
            ],
          ),
        ),
      ),
    );
  },
),

        ),
      ],
    );
  }
}
