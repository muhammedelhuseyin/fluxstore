import 'package:flutter/material.dart';
import 'package:fluxstore/core/helper/app_images.dart';
import 'package:fluxstore/home/models/products_model.dart';

class Poplists {
  static List<ProductsModel> Popularthisweek = [
    ProductsModel(
        id: "1",
        image: AppImages.discover6,
        title: "Lihua Tunic White",
        price: 53.00,
        rating: 4.2,
        ratingCount: 55,
        colors: [],
        description: '',
        sizes: []),
    ProductsModel(
        id: "2",
        image: AppImages.discover7,
        title: "Skirt Dress",
        price: 34.00,
        rating: 3.2,
        ratingCount: 45,
        colors: [],
        description: '',
        sizes: [])
  ];
  static List<Color> color = [
    Color(0xffCE8722),
    Color(0xffDC4447),
    Color(0xff181E27),
    Color(0xff44565C),
    Color(0xffE4E4E4),
    Color(0xff6D4F44),
    Color(0xffDFA8A9),
  ];
}
