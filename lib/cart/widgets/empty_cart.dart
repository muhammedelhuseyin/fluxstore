import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class EmptyCartView extends StatelessWidget {
  final VoidCallback onShop;

  const EmptyCartView({super.key, required this.onShop});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          // LOTTIE
          SizedBox(
            width: 230,
            height: 230,
            child: Lottie.asset(
              "assets/lottie/empty_cart.json",
              fit: BoxFit.contain,
            ),
          ),

          const SizedBox(height: 20),

          Text(
            "Your cart is empty",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),

          const SizedBox(height: 10),

          Text(
            "Looks like you haven’t added anything yet.",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade600,
            ),
          ),

          const SizedBox(height: 30),

          ElevatedButton(
            onPressed: onShop,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              padding:
                  const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32),
              ),
            ),
            child: const Text(
              "Shop Now",
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
