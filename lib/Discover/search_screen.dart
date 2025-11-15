import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/widgets/custom_back_button.dart';
import 'package:fluxstore/Discover/widgets/filter_drawer.dart';
import 'package:fluxstore/Discover/widgets/poplists.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';
import 'package:fluxstore/core/them/app_colors.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:fluxstore/core/widgets/search_bar.dart';
import 'package:fluxstore/home/Widgets/section_header.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  RangeValues _priceRange = const RangeValues(10, 80);
  int selectedRating = 0;
  String selectedCategory = "Crop Tops";

  List<String> categories = [
    "Crop Tops",
    "T-Shirts",
    "Dresses",
    "Pants",
    "Jackets",
  ];
  List<String> Discount = [
    "50% off",
    "40% off",
    "30% off",
    "20% off",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      endDrawerEnableOpenDragGesture: false,
      appBar: AppBar(
        
        actions: const [SizedBox.shrink()], // بدلاً من []

        automaticallyImplyLeading: false,

        title: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: CustomBackButton(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Gap(20),
              Builder(
                builder: (context) {
                  return SearchBarWidget(
                    readonly: true, ontap: () { 
                  context.push('/FoundResults');
                 }, 
                    onPressed: () {
                      Scaffold.of(context)
                          .openEndDrawer(); // يفتح الـ Drawer بشكل صحيح
                    },
                  );
                },
              ),

              Gap(25),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    AppStrings.RecentSearches,
                    style: AppStyles.semibold16.copyWith(
                        color: AppColors.regulartxt.withValues(alpha: 0.40)),
                  ),
                  Image.asset(
                    AppImages.search1,
                    scale: 3,
                  )
                ],
              ),
              Gap(28),
              GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, // عدد الأعمدة
                    mainAxisSpacing: 10, // المسافة الرأسية بين العناصر
                    crossAxisSpacing: 10, // المسافة الأفقية بين العناصر
                    childAspectRatio: 3, // للتحكم بنسبة العرض إلى الارتفاع
                  ),
                  itemCount: AppStrings.RecentSearcheslist.length,
                  itemBuilder: (context, i) {
                    final Recent = AppStrings.RecentSearcheslist[i];
                    return Container(
                      width: 163,
                      height: 38,
                      decoration: BoxDecoration(
                          color: Color(0xffFAFAFA),
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(Recent),
                          Image.asset(
                            AppImages.Close_round,
                            scale: 3,
                          )
                        ],
                      ),
                    );
                  }),
              //Gap(70),
              SectionHeader(
                Title: AppStrings.Popularthisweek,
                actionText: AppStrings.Showall,
              ),
              Gap(27),
              SizedBox(
                height: 227,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: Poplists.Popularthisweek.length,
                  itemBuilder: (context, index) {
                    final product = Poplists.Popularthisweek[index];

                    return Padding(
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
                              decoration:
                                  const BoxDecoration(color: Color(0xffF4F4F4)),
                              height: 172,
                              width: 126,
                              child: Image.asset(product.images[index]),
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
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
              Gap(80),
            ],
          ),
        ),
      ),
      endDrawer:  FilterDrawer(
  priceRange: _priceRange,
  onPriceChanged: (v) => setState(() => _priceRange = v),

  selectedRating: selectedRating,
  onRatingChanged: (v) => setState(() => selectedRating = v),

  selectedCategory: selectedCategory,
  onCategoryChanged: (v) => setState(() => selectedCategory = v),

  categories: categories,
  discounts: Discount,
),

    );
  }
}
