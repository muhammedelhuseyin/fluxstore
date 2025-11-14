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
  final String image;
  final String title;
  final double price;

  ProductsModel(
      {required this.id,
      required this.image,
      required this.title,
      required this.price});

  static List<ProductsModel> homeproduct = [
    ProductsModel(
        id: "1",
        image: AppImages.home2,
        title: AppStrings.TurtleneckSweater,
        price: 39.99),
    ProductsModel(
        id: "2",
        image: AppImages.home3,
        title: AppStrings.LongSleeveDress,
        price: 45.00),
    ProductsModel(
        id: "1",
        image: AppImages.home4,
        title: AppStrings.SportwearSet,
        price: 80.00),
    ProductsModel(
        id: "1",
        image: AppImages.home5,
        title: AppStrings.ElegantDress,
        price: 75.00),
  ];

  static List<ProductsModel> Recommended = [
    ProductsModel(
        id: "1",
        image: AppImages.home9,
        title: AppStrings.Whitefashionhoodie,
        price: 29.00),
    ProductsModel(
        id: "2",
        image: AppImages.home10,
        title: AppStrings.CottonTshirt,
        price: 30.00),
  ];
}
