import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/Models/product_models.dart';
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
  bool isPressed = false;

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
                  "Found \n${ProductModel.PopularDresses.length} Results",
                  style: AppStyles.semibold20,
                ),
                Builder(
                  builder: (BuildContext context) { 
                    return GestureDetector(
                           onTap: () {
                                Scaffold.of(context)
                                    .openEndDrawer(); // يفتح الـ Drawer بشكل صحيح
                              }, 
                      child: Container(
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
                          Icon(Icons.arrow_drop_down)
                        ],
                      ),
                                        ),
                    );
                   },
                 
                ),
              ],
            ),
            Gap(35),
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 25,
                  crossAxisSpacing: 15,
                  childAspectRatio: 0.52, // ← هذا المناسب 100%
                ),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: ProductModel.PopularDresses.length,
                itemBuilder: (context, index) {
                  final product = ProductModel.PopularDresses[index];

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
                                child: Image.asset(
                                  product.image,
                                  height: 210,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),

                              // ♥ زر المفضلة لكل منتج مستقل
                              Positioned(
                                right: 5,
                                top: 5,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      product.isFavorite = !product.isFavorite;
                                    });
                                  },
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                      color: Colors.white,
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.favorite,
                                      color: product.isFavorite
                                          ? Colors.red
                                          : Colors.grey.shade300,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),

                          const Gap(14),

                          // اسم المنتج
                          Text(
                            product.title,
                            style: AppStyles.Regular14,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),

                          const Gap(2),

                          // السعر
                          product.oldPrice == null
                              ? Text(
                                  "\$${product.price.toStringAsFixed(2)}",
                                  style: AppStyles.semibold16,
                                )
                              : Row(
                                  spacing: 5,
                                  children: [
                                    Text(
                                      "\$${product.price.toStringAsFixed(2)}",
                                      style: AppStyles.semibold16,
                                    ),
                                    Text(
                                      "\$${product.oldPrice!.toStringAsFixed(2)}",
                                      style: AppStyles.semibold16.copyWith(
                                        decoration: TextDecoration.lineThrough,
                                        decorationColor: Colors.red,
                                        decorationThickness: 2,
                                        color: Colors.grey.shade400,
                                      ),
                                    ),
                                  ],
                                ),

                          const Gap(3),

                          // التقييم + عدد المراجعات
                          Row(
                            children: [
                              ...List.generate(
                                5,
                                (i) => Icon(
                                  Icons.star,
                                  size: 13,
                                  color: i < product.rating.round()
                                      ? const Color(0xff508A7B)
                                      : Colors.grey.shade300,
                                ),
                              ),
                              const SizedBox(width: 4),
                              Text("(${product.reviews})"),
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
