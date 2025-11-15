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
  final String title;
  final double price;
  final String image; // مسار الصورة من assets
  final double rating; // مثال: 4.9
  final int ratingCount; // مثال: 63
  final List<Color> colors; // الألوان
  final List<String> sizes;

  ProductsModel({
    required this.title,
    required this.price,
    required this.image,
    required this.rating,
    required this.ratingCount,
    required this.colors,
    required this.sizes,
    required String id,
  });

  static List<ProductsModel> homeproduct = [
    ProductsModel(
        id: "1",
        image: AppImages.home2,
        title: AppStrings.TurtleneckSweater,
        price: 39.99,
        rating: 4,
        ratingCount: 96,
        colors: [],
        sizes: []),
    ProductsModel(
        id: "2",
        image: AppImages.home3,
        title: AppStrings.LongSleeveDress,
        price: 45.00,
        rating: 4.5,
        ratingCount: 44,
        colors: [],
        sizes: []),
    ProductsModel(
        id: "3",
        image: AppImages.home4,
        title: AppStrings.SportwearSet,
        price: 80.00,
        rating: 4.2,
        ratingCount: 22,
        colors: [],
        sizes: []),
    ProductsModel(
        id: "4",
        image: AppImages.home5,
        title: AppStrings.ElegantDress,
        price: 75.00,
        rating: 3.9,
        ratingCount: 49,
        colors: [],
        sizes: []),
  ];

  static List<ProductsModel> Recommended = [
    ProductsModel(
        id: "5",
        image: AppImages.home9,
        title: AppStrings.Whitefashionhoodie,
        price: 29.00,
        rating: 4,
        ratingCount: 58,
        colors: [],
        sizes: []),
    ProductsModel(
        id: "6",
        image: AppImages.home10,
        title: AppStrings.CottonTshirt,
        price: 30.00,
        rating: 5,
        ratingCount: 88,
        colors: [],
        sizes: []),
  ];
}
