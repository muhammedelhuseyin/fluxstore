import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/widgets/custom_back_button.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:fluxstore/product/data/Similar_product.dart';
import 'package:gap/gap.dart';

class ProductDatelis extends StatefulWidget {
  final String title;          // اسم المنتج
  final double price;          // سعر المنتج
  final String image;          // صورة المنتج
  final double rating;         // قيمة النجوم مثل 4.9
  final int ratingCount;       // عدد التقييمات مثل 63
  final List<Color> colors;    // الألوان
  final List<String> sizes;    // المقاسات
  final String description;    // الوصف

  const ProductDatelis({
    super.key,
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.colors,
    required this.sizes,
    required this.description,
  });

  @override
  State<ProductDatelis> createState() => _ProductFullState();
}

class _ProductFullState extends State<ProductDatelis> {
  bool isDescriptionExpanded = false; //متغير حالة من اجل قسم الوصف
  bool isReviewsExpanded = false; //متغير حالة من اجل قسم الوصف
  bool isSimilarExpanded = false;
  int selectedColor = 0;
  int selectedSize = 0; // أو خليها -1 لو بدك بدون اختيار مبدئي

  List<Color> colors = [
    Color(0xffE2C7B7),
    Colors.black,
    Color(0xffFF6B6B),
  ];
  List<String> sizes = [
    "S",
    "M",
    "L",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       bottomNavigationBar: _buildAddToCart(),
      backgroundColor: Color(0xffFFFCFA),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 405,
                  decoration: BoxDecoration(color: Color(0xffFFFCFA)),
                ),
                Positioned(
                  top: 55,
                  left: 30,
                  child: CustomBackButton(),
                ),
                Positioned(
                  top: 55,
                  right: 30,
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 15,
                          spreadRadius: -6,
                          offset: Offset(1, 1),
                        ),
                      ],
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.favorite, color: Colors.red),
                  ),
                ),
                Positioned(
                  top: -22,
                  left: 0,
                  right: 0,
                  child: Image.asset(
                    AppImages.det1,
                    scale: 5,
                  ),
                ),
              ],
            ),
            Container(
              //height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black,
                      blurRadius: 15,
                      spreadRadius: -6,
                      offset: Offset(1, 1),
                    ),
                  ],
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  )),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(45),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sportwear Set",
                          style: AppStyles.semibold20,
                        ),
                        Text(
                          "\$ 80.00",
                          style: AppStyles.semibold22,
                        ),
                      ],
                    ),
                    Gap(15),
                    Row(
                      spacing: 2,
                      children: [
                        ...List.generate(5, (i) {
                          return Icon(
                            Icons.star,
                            color: Color(0xff508A7B),
                          );
                        }),
                        Text("(63)"),
                      ],
                    ),
                    Gap(20),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    Gap(10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Color",
                              style: AppStyles.Regular14,
                            ),
                            Gap(10),
                            Row(
                              children: List.generate(colors.length, (i) {
                                return GestureDetector(
                                  onTap: () =>
                                      setState(() => selectedColor = i),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 10),
                                    padding: EdgeInsets.all(
                                        selectedColor == i ? 4 : 0),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: selectedColor == i
                                            ? Colors.black
                                            : Colors.transparent,
                                        width: 2,
                                      ),
                                      boxShadow: selectedColor == i
                                          ? [
                                              BoxShadow(
                                                color: Colors.black
                                                    .withOpacity(0.25),
                                                blurRadius: 12,
                                                offset: const Offset(0, 4),
                                              ),
                                            ]
                                          : [],
                                    ),
                                    child: CircleAvatar(
                                      radius: 12,
                                      backgroundColor: colors[i],
                                    ),
                                  ),
                                );
                              }),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Size",
                              style: AppStyles.Regular14,
                            ),
                            Row(
                              children: List.generate(sizes.length, (i) {
                                return GestureDetector(
                                  onTap: () => setState(() => selectedSize = i),
                                  child: Container(
                                    margin: EdgeInsets.only(right: 12),
                                    padding: EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: selectedSize == i
                                          ? Colors.black
                                          : Colors.grey.shade200,
                                    ),
                                    child: Text(
                                      sizes[i],
                                      style: TextStyle(
                                        color: selectedSize == i
                                            ? Colors.white
                                            : Colors.black,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                    Gap(10),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isDescriptionExpanded = !isDescriptionExpanded;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Description",
                              style: AppStyles.semibold20,
                            ),
                            Gap(10),
                         

                            // السهم اللي بيدور
                            AnimatedRotation(
                              turns: isDescriptionExpanded
                                  ? 0.5
                                  : 0, // نصف دورة = 180°
                              duration: const Duration(milliseconds: 250),
                              child: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: isDescriptionExpanded
                          ? Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Text(
                                "Sportswear is no longer under culture, it is no longer indie or "
                                "cobbled together as it once was. Sport is fashion today. "
                                "The top is oversized in fit and style, may need to size down.",
                                style: AppStyles.Regular14.copyWith(
                                    color: Colors.grey.shade700),
                              ),
                            )
                          : const SizedBox.shrink(),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isReviewsExpanded = !isReviewsExpanded;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Reviews",
                              style: AppStyles.semibold20,
                            ),
                            Gap(10),
                           

                            // السهم اللي بيدور
                            AnimatedRotation(
                              turns: isReviewsExpanded
                                  ? 0.5
                                  : 0, // نصف دورة = 180°
                              duration: const Duration(milliseconds: 250),
                              child: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: Duration(milliseconds: 300),
                      child: isReviewsExpanded
                          ? _buildReviewContent()
                          : SizedBox.shrink(),
                    ),




                    //        Similar Product
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSimilarExpanded = !isSimilarExpanded;
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Similar Product",
                              style: AppStyles.semibold20,
                            ),
                            Gap(10),
                           

                            // السهم اللي بيدور
                            AnimatedRotation(
                              turns: isSimilarExpanded
                                  ? 0.5
                                  : 0, // نصف دورة = 180°
                              duration: const Duration(milliseconds: 250),
                              child: const Icon(Icons.keyboard_arrow_down),
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedSize(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      child: isSimilarExpanded
                          ?  SizedBox(
                      height: 227,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: SimilarProduct.similarProduct.length,
                          itemBuilder: (context, i) {
                            final product = SimilarProduct.similarProduct[i];
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
                                      decoration: const BoxDecoration(
                                          color: Color(0xffF4F4F4)),
                                      height: 172,
                                      width: 126,
                                      child: Image.asset(product.image),
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
                          }),
                    )
                          : const SizedBox.shrink(),
                    ),
                    Divider(
                      color: Colors.grey.shade300,
                    ),
                   
                   
                    Gap(30),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildReviewContent() {
    return Column(
      children: [
        Divider(color: Colors.grey.shade300),

        // تقييم عام 4.9
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text("4.9",
                    style:
                        TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                Text("OUT OF 5",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    )),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: List.generate(5, (i) {
                    return Icon(Icons.star, size: 22, color: Color(0xff508A7B));
                  }),
                ),
                const SizedBox(height: 4),
                Text("83 ratings", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),

        // توزيع التقييمات
        _ratingRow(5, 0.80),
        _ratingRow(4, 0.12),
        _ratingRow(3, 0.05),
        _ratingRow(2, 0.03),
        _ratingRow(1, 0.00),

        const SizedBox(height: 20),
        Divider(color: Colors.grey.shade300),

        // 47 reviews + write a review
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("47 Reviews",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 14)),
            Row(
              children: [
                Text("WRITE A REVIEW",
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                        color: Color(0xff508A7B))),
                SizedBox(width: 6),
                Icon(Icons.edit, size: 16, color: Colors.grey),
              ],
            ),
          ],
        ),
        Gap(40),
        Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(AppImages.det2),
              ),
              title: Text(
                "Muhammed Al Hussein",
                style: AppStyles.semibold16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Row(
                children: List.generate(5, (i) {
                  return Icon(Icons.star, size: 15, color: Color(0xff508A7B));
                }),
              ),
              trailing: Text(
                "5h ago",
                style: AppStyles.Regular13,
              ),
            ),
            Gap(10),
            Text(
              """I love it.  Awesome customer service!! Helped me out with adding an additional item to my order. Thanks again!""",
              style: AppStyles.Regular12,
            ),
          ],
        ),
        Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(AppImages.det2),
              ),
              title: Text(
                "Muhammed Al Hussein",
                style: AppStyles.semibold16,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Row(
                children: List.generate(5, (i) {
                  return Icon(Icons.star, size: 15, color: Color(0xff508A7B));
                }),
              ),
              trailing: Text(
                "5h ago",
                style: AppStyles.Regular13,
              ),
            ),
            Gap(10),
            Text(
              """I'm very happy with order, It was delivered on and good quality. Recommended!""",
              style: AppStyles.Regular12,
            ),
          ],
        ),
        Gap(28),
      ],
    );
  }

  Widget _ratingRow(int stars, double progress) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$stars",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
          SizedBox(width: 6),
          Icon(Icons.star, size: 18, color: Color(0xff508A7B)),
          SizedBox(width: 12),

          // Progress line
          Expanded(
            child: LinearProgressIndicator(
              value: progress,
              minHeight: 6,
              backgroundColor: Colors.grey.shade300,
              valueColor: AlwaysStoppedAnimation(Color(0xff508A7B)),
            ),
          ),

          SizedBox(width: 12),
          Text("${(progress * 100).round()}%",
              style: TextStyle(color: Colors.grey)),
        ],
      ),
    );
  }

Widget _buildAddToCart() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 32),
    decoration: const BoxDecoration(
      color: Colors.black,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(20),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.shopping_bag, color: Colors.white),
        SizedBox(width: 12),
        Text(
          "Add To Cart",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    ),
  );
}
}
