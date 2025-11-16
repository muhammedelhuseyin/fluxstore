import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluxstore/home/models/products_model.dart';

class CartService {
  static final CartService _instance = CartService._internal();
  factory CartService() => _instance;
  CartService._internal();

  static const String cartKey = "CART_ITEMS";

  List<Map<String, dynamic>> cartItems = [];

  Future<void> loadCart() async {
    final prefs = await SharedPreferences.getInstance();
    final data = prefs.getString(cartKey);

    if (data != null) {
      cartItems = List<Map<String, dynamic>>.from(jsonDecode(data));
    }
  }

  Future<void> saveCart() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(cartKey, jsonEncode(cartItems));
  }


  //مسح عنصر من السلة 
  Future<void> removeFromCart(int index) async {
  cartItems.removeAt(index);
  await saveCart();
}


//مسح عناصر السلة كاملة 
Future<void> clearCart() async {
  cartItems.clear();
  final prefs = await SharedPreferences.getInstance();
  await prefs.remove(cartKey);
  print("🧹 Cart cleared");
}



Future<void> addToCart({
  required ProductsModel product,
  required String size,
  required Color color,
}) async {
  cartItems.add({
    "id": product.id,
    "title": product.title,
    "price": product.price,
    "image": product.images.isNotEmpty ? product.images[0] : "",
    "size": size,
    "color": color.value,   // نخزن اللون كقيمة int
    "qty": 1,
  });

  await saveCart();
  print("🛒 Saved Cart: $cartItems");
}

}
