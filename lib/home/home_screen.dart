import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/home/Widgets/bottom_category_section.dart';
import 'package:fluxstore/home/Widgets/categories_section.dart';
import 'package:fluxstore/core/widgets/costum_app_bar.dart';
import 'package:fluxstore/home/Widgets/featured_section.dart';
import 'package:fluxstore/home/Widgets/main_banner.dart';
import 'package:fluxstore/home/Widgets/new_collection_section.dart';
import 'package:fluxstore/home/Widgets/recommended_section.dart';
import 'package:fluxstore/home/Widgets/section_header.dart';
import 'package:fluxstore/home/Widgets/top_collection_section.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedindex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CostumAppBar(),
      //
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Gap(36),
              CategoriesSection(),
              Gap(30),
              BannerSection(),
              Gap(30),
              FeaturedSection(),
              Gap(18),
              NewCollectionSection(),
              Gap(25),
              RecommendedSection(),
              Gap(34),
              SectionHeader(
                  Title: AppStrings.TopCollection,
                  actionText: AppStrings.Showall),
              Gap(33),
              TopCollectionSection(),
              Gap(10),
              BottomCategorySection(),
              Gap(50),
            ],
          ),
        ),
      ),
    );
  }
}
