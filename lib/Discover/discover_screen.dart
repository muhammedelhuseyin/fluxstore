import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/widgets/category_card.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_colors.dart';

import 'package:fluxstore/core/widgets/costum_app_bar.dart';
import 'package:fluxstore/core/widgets/search_bar.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              SearchBarWidget(
                readonly: true, ontap: () { 
                  context.push('/search');
                 }, onPressed: () {  },
              ),
              Gap(34),
              CategoryCard(
                title: AppStrings.CLOTHING,
                image: AppImages.descover2,
                containercolor: AppColors.Container1,
                circlecolor: AppColors.circ1,
              ),
              Gap(19),
              CategoryCard(
                title: AppStrings.ACCESSORIES,
                image: AppImages.descover3,
                containercolor: AppColors.Container2,
                circlecolor: AppColors.circ2,
                right: 0,
              ),
              Gap(19),
              CategoryCard(
                title: AppStrings.SHOES,
                image: AppImages.descover4,
                containercolor: AppColors.Container3,
                circlecolor: AppColors.circ3,
                right: 25,
              ),
              Gap(19),
              CategoryCard(
                title: AppStrings.COLLECTION,
                image: AppImages.descover5,
                containercolor: AppColors.Container4,
                circlecolor: AppColors.circ4,
                right: 30,
              ),
              Gap(19),
              Gap(19),
            ],
          ),
        ),
      ),
    );
  }
}
