import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/core/helper/app_strings.dart';

class Categorie {
  final String title;
  final String icon;

  Categorie({required this.title, required this.icon});

  static List<Categorie> categories = [
    Categorie(title: AppStrings.home_cate1, icon: AppImages.cate1),
    Categorie(title: AppStrings.home_cate2, icon: AppImages.cate2),
    Categorie(title: AppStrings.home_cate3, icon: AppImages.cate3),
    Categorie(title: AppStrings.home_cate4, icon: AppImages.cate4),
  ];
}

class ProductsModel {
  final String id;
  final String title;
  final String description;
  final double price;
  final List<String> images;
  final double rating;
  final int ratingCount;
  final List<Color> colors;
  final List<String> sizes;

  ProductsModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.rating,
    required this.ratingCount,
    required this.colors,
    required this.sizes,
  });

static List<ProductsModel> homeproduct = [
  ProductsModel(
        id: "1",
        images:[
           AppImages.home2,
           AppImages.home2,
           AppImages.home2,
           ],
        title: AppStrings.TurtleneckSweater,
        price: 39.99,
        rating: 4,
        ratingCount: 96,
        colors: [
          Color(0xffE2C7B7),
          Colors.black,
          Color(0xffFF6B6B),
        ],
        sizes: [
          "S",
          "M",
          "L",
        ],
        description:
            'A cozy turtleneck sweater crafted from soft, warm fabric. Perfect for winter outfits and everyday comfort.',
  ),
    ProductsModel(
        id: "2",
        images: [
          AppImages.home3,
          AppImages.home3,
          AppImages.home3,
          ],
        title: AppStrings.LongSleeveDress,
        price: 45.00,
        rating: 4.5,
        ratingCount: 44,
        colors: [
          Colors.black,
          Color(0xffD4A5A5),
          Color(0xffC9C9C9),
        ],
        sizes: [
          "S",
          "M",
          "L",
          "XL",
        ],
        description:
            'Elegant long sleeve dress with a modern fit. Lightweight fabric designed for smooth movement and a classy look.',
    ),
    ProductsModel(
        id: "3",
        images: [
          AppImages.home4,
          AppImages.home4,
          AppImages.home4,
          ],
        title: AppStrings.SportwearSet,
        price: 80.00,
        rating: 4.2,
        ratingCount: 22,
        colors: [
          Color(0xffE2C7B7),
          Color(0xff508A7B),
          Colors.black,
        ],
        sizes: [
          "S",
          "M",
        ],
        description:
            'A premium-quality sportwear set made for flexibility and daily training. Breathable and stretchy material.',
    ),
    ProductsModel(
        id: "4",
        images: [
          AppImages.home5,
          AppImages.home5,
          AppImages.home5,
          ],
        title: AppStrings.ElegantDress,
        price: 75.00,
        rating: 3.9,
        ratingCount: 49,
        colors: [
          Colors.black,
          Color(0xff8A5082),
          Color(0xffC9A7EB),
        ],
        description:
            'A refined elegant dress perfect for special occasions. Designed with smooth lines and premium fabric.',
        sizes: [
          "XS",
          "S",
          "M",
          "L",
        ],
    ),
  ];

  static List<ProductsModel> Recommended = [
    ProductsModel(
        id: "5",
        images: [
          AppImages.home9,
          AppImages.home9,
          AppImages.home9,
          ],
        title: AppStrings.Whitefashionhoodie,
        price: 29.00,
        rating: 4,
        ratingCount: 58,
        colors: [],
        description: '',
        sizes: []),
    ProductsModel(
        id: "6",
        images: [
          AppImages.home10,
          AppImages.home10,
          AppImages.home10,
          ],
        title: AppStrings.CottonTshirt,
        price: 30.00,
        rating: 5,
        ratingCount: 88,
        colors: [],
        description: '',
        sizes: []),
  ];
}
