import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/widgets/custom_back_button.dart';
import 'package:fluxstore/Discover/widgets/filter_drawer.dart';
import 'package:fluxstore/Discover/widgets/poplists.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:gap/gap.dart';

class FoundResults extends StatefulWidget {
  const FoundResults({super.key});

  @override
  State<FoundResults> createState() => _FoundResultsState();
}

class _FoundResultsState extends State<FoundResults> {
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

  List<String> discounts = [
    "50% off",
    "40% off",
    "30% off",
    "20% off",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: FilterDrawer(
        priceRange: _priceRange,
        onPriceChanged: (v) => setState(() => _priceRange = v),
        selectedRating: selectedRating,
        onRatingChanged: (v) => setState(() => selectedRating = v),
        selectedCategory: selectedCategory,
        onCategoryChanged: (v) => setState(() => selectedCategory = v),
        categories: categories,
        discounts: discounts,
      ),
      appBar: AppBar(
        actions: [SizedBox.shrink()],
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.only(left: 12, top: 12),
          child: Row(
            spacing: 25,
            children: [
              CustomBackButton(),
              Text(
                "Dresses",
                style: AppStyles.semibold16,
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 27),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Found \n152 Results",
                  style: AppStyles.semibold20,
                ),
                Container(
                  height: 40,
                  width: 97,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    border: Border.all(color: Colors.grey.shade300, width: 3),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        "Filter",
                        style:
                            AppStyles.Regular14.copyWith(color: Colors.black),
                      ),
                      Builder(builder: (context) {
                        return GestureDetector(
                            onTap: () {
                              Scaffold.of(context)
                                  .openEndDrawer(); // يفتح الـ Drawer بشكل صحيح
                            },
                            child: Icon(Icons.arrow_drop_down));
                      })
                    ],
                  ),
                ),
              ],
            ),
            Gap(35),
            SizedBox(
              height: 287,
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
                          Stack(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                    color: Color(0xffF4F4F4)),
                                height: 172,
                                width: 126,
                                child: Image.asset(product.image),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: GestureDetector(
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Gap(14),
                          Text(
                            product.title,
                            style: AppStyles.Regular14,
                          ),
                          const Gap(2),
                          Row(
                            spacing: 5,
                            children: [
                              Text(
                                "\$ ${product.price}",
                                style: AppStyles.semibold16,
                              ),
                              Text(
                                "\$90.00",
                                style: AppStyles.semibold16.copyWith(
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.red,
                                  decorationThickness: 2, // سمك الخط
                                  color: Colors.grey.shade400, // لون النص
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Color(0xff508A7B),
                              ),
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Color(0xff508A7B),
                              ),
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Color(0xff508A7B),
                              ),
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Color(0xff508A7B),
                              ),
                              Icon(
                                Icons.star,
                                size: 13,
                                color: Color(0xff508A7B),
                              ),
                              Text("(64)"),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
