import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:fluxstore/Discover/widgets/poplists.dart';
import 'package:fluxstore/core/helper/app_images.dart';

class FilterDrawer extends StatelessWidget {
  final RangeValues priceRange;
  final Function(RangeValues) onPriceChanged;

  final int selectedRating;
  final Function(int) onRatingChanged;

  final String selectedCategory;
  final Function(String) onCategoryChanged;

  final List<String> categories;
  final List<String> discounts;

  const FilterDrawer({
    super.key,
    required this.priceRange,
    required this.onPriceChanged,
    required this.selectedRating,
    required this.onRatingChanged,
    required this.selectedCategory,
    required this.onCategoryChanged,
    required this.categories,
    required this.discounts,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 27, vertical: 45),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // ------- Header -------
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Filter",
                    style: AppStyles.semibold20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context); // يغلق الدراور
                    },
                    child: Image.asset(
                      AppImages.descover1,
                      scale: 3.7,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),

              const Gap(25),
              const Divider(),
              const Gap(24),

              // ------- Price -------
              const Text(
                "Price",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 16),

              RangeSlider(
                values: priceRange,
                min: 0,
                max: 500,
                divisions: 20,
                activeColor: Colors.black,
                inactiveColor: Colors.grey.shade300,
                labels: RangeLabels(
                  "\$${priceRange.start.toInt()}",
                  "\$${priceRange.end.toInt()}",
                ),
                onChanged: (values) => onPriceChanged(values),
              ),

              const Gap(10),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "\$${priceRange.start.toInt()}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.purple),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      "\$${priceRange.end.toInt()}",
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),

              const Gap(40),
              Text("Color", style: AppStyles.Regular14),
              const Gap(23),

              Row(
                spacing: 16,
                children: List.generate(Poplists.color.length, (i) {
                  return Container(
                    height: 22,
                    width: 22,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Poplists.color[i],
                    ),
                  );
                }),
              ),

              const Gap(35),
              Text("Star Rating", style: AppStyles.Regular14),
              const Gap(24),

              Row(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(5, (index) {
                  int number = index + 1;
                  bool isSelected = number == selectedRating;

                  return GestureDetector(
                    onTap: () => onRatingChanged(number),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: 38,
                      height: 38,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: isSelected ? Colors.black : Colors.white,
                        border: Border.all(
                          color: Colors.black,
                          width: 2,
                        ),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.star,
                              size: 18,
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              number.toString(),
                              style: TextStyle(
                                fontSize: 16,
                                color: isSelected ? Colors.white : Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),

              const Gap(40),
              Text("Category", style: AppStyles.Regular14),
              const Gap(16),

              Container(
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  border: Border.all(
                      color: Colors.black.withOpacity(0.2), width: 2),
                ),
                child: Row(
                  children: [
                    Icon(Icons.checkroom, size: 16, color: Colors.black87),
                    const Gap(12),
                    Expanded(
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: selectedCategory,
                          items: categories.map((String item) {
                            return DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (v) => onCategoryChanged(v!),
                          icon: const Icon(Icons.keyboard_arrow_down,
                              color: Colors.black),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Gap(40),
              Text("Discount", style: AppStyles.Regular14),
              const Gap(17),

              GridView.builder(
                shrinkWrap: true,
                itemCount: discounts.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 2.5,
                ),
                itemBuilder: (context, i) {
                  return ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: const BorderSide(
                            color: Colors.black, width: 2),
                      ),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          discounts[i],
                          style: const TextStyle(color: Colors.black),
                        ),
                        const Icon(Icons.close),
                      ],
                    ),
                  );
                },
              ),

              const Gap(40),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size(115, 50),
                      backgroundColor: Colors.grey.shade200,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Reset",
                        style: AppStyles.Regular14.copyWith(color: Colors.black)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(115, 50),
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    onPressed: () {},
                    child: Text("Apply",
                        style: AppStyles.Regular14.copyWith(color: Colors.white)),
                  ),
                ],
              ),

              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
