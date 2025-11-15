import 'package:fluxstore/core/helper/app_images.dart';

class ProductModel {
  final String title;
  final String image;
  final double price;           // السعر الحالي
  final double? oldPrice;       // السعر قبل الخصم (اختياري)
  final double rating;          // عدد النجوم من 5
  final int reviews;            // عدد المراجعات
  bool isFavorite;              // حالة المفضلة

  ProductModel({
    required this.title,
    required this.image,
    required this.price,
    this.oldPrice,
    required this.rating,
    required this.reviews,
    this.isFavorite = false,
  });

  bool get hasDiscount => oldPrice != null;

static List<ProductModel> PopularDresses = [
  ProductModel(
    title: "Linen Dress",
    image:AppImages.res1,
    price: 52.00,
    oldPrice: 90.00,
    rating: 4.5,
    reviews: 64,
  ),
  ProductModel(
    title: "Flited Waist Dress",
    image: AppImages.res2,
    price: 47.99,
    oldPrice: 82.00,
    rating: 4.5,
    reviews: 53,
  ),
  ProductModel(
    title: "Maxi Dress",
    image: AppImages.res3,
    price: 68.00,
    rating: 4.7,
    reviews: 46,
  ),
  ProductModel(
    title: "Front Tie Mini Dress",
    image: AppImages.res4,
    price: 59.00,
    rating: 4.3,
    reviews: 38,
  ),

];



}
