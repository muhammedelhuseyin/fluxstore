import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/home/models/products_model.dart';

class SimilarProduct {
  static List<ProductsModel> similarProduct = [
    ProductsModel(
        id: "7",
        image: AppImages.det3,
        title: "Rise Crop Hoodie",
        price: 43.00,
        rating: 5,
        ratingCount: 72,
        colors: [],
        sizes: []),
    ProductsModel(
        id: "8",
        image: AppImages.det4,
        title: "Gym Crop Top",
        price: 39.99,
        rating: 4.7,
        ratingCount: 87,
        colors: [],
        sizes: []),
    ProductsModel(
        id: "9",
        image: AppImages.det3,
        title: "Sport Sweatshirt",
        price: 47.99,
        rating: 3.8,
        ratingCount: 37,
        colors: [],
        sizes: []),
  ];
}
