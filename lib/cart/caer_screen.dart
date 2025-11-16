import 'package:flutter/material.dart';
import 'package:fluxstore/cart/service/cart_service.dart';
import 'package:fluxstore/cart/widgets/empty_cart.dart';
import 'package:fluxstore/core/them/app_styles.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  List<bool> _isDeleted = [];
  final cart = CartService();

  // يضمن أن قيمة t لا تتجاوز [0..1]
  double safeT(double t) => t.clamp(0.0, 1.0);

  @override
  Widget build(BuildContext context) {
    final items = cart.cartItems;
    if (_isDeleted.length != items.length) {
      _isDeleted = List.generate(items.length, (_) => false);
    }

    double total = 0;
    for (var item in items) {
      total += item['price'] * item['qty'];
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          "Your Cart",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_outline, color: Colors.black),
            onPressed: () async {
              if (items.isEmpty) return;

              final previousItems = List.from(cart.cartItems);

              final confirm = await showConfirmDialog(
                context: context,
                title: "Clear cart?",
                message:
                    "Are you sure you want to remove all items from your cart?",
                confirmText: "Clear All",
                enableUndo: true,
                onUndo: () async {
                  cart.cartItems = List.from(previousItems);
                  await cart.saveCart();
                  setState(() {});
                },
              );

              if (confirm == true) {
                await cart.clearCart();
                setState(() {});
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 450),
              switchInCurve: Curves.easeIn,
              switchOutCurve: Curves.easeIn,
              transitionBuilder: (child, animation) {
                return FadeTransition(
                  opacity: animation,
                  child: ScaleTransition(
                    scale: Tween(begin: 0.97, end: 1.0).animate(
                      CurvedAnimation(
                        parent: animation,
                        curve: Curves.easeOut,
                      ),
                    ),
                    child: child,
                  ),
                );
              },
              child: items.isEmpty
                  ? EmptyCartView(
                      key: const ValueKey("empty_cart"),
                      onShop: () => context.push("/home"),
                    )
                  : ListView.separated(
                      key: const ValueKey("full_cart"),
                      padding: const EdgeInsets.all(16),
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemCount: items.length,
                      itemBuilder: (_, index) {
                        final item = items[index];
                        return AnimatedSwitcher(
                          duration: const Duration(milliseconds: 350),
                          child: !_isDeleted[index]
                              ? _buildCartItem(item, index)
                              : const SizedBox(key: ValueKey("empty_item")),
                        );
                      },
                    ),
            ),
          ),

          // SUMMARY
          if (items.isNotEmpty)
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -3),
                  )
                ],
              ),
              child: Column(
                children: [
                  _rowInfo("Product price", "\$${total.toStringAsFixed(2)}"),
                  const SizedBox(height: 10),
                  _rowInfo("Shipping", "Freeship"),
                  const SizedBox(height: 10),
                  _rowInfo("Subtotal", "\$${total.toStringAsFixed(2)}",
                      bold: true),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Proceed to checkout",
                        style:
                            AppStyles.semibold16.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  // 🛒 Cart Item Widget
  Widget _buildCartItem(Map<String, dynamic> item, int index) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
    context.push("/product_from_cart", extra: item);
  },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Container(
                width: 90,
                height: 90,
                color: const Color(0xffF4F4F4),
                padding: const EdgeInsets.all(4),
                child: Image.asset(item["image"], fit: BoxFit.contain),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        item["title"],
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        final removedItem = cart.cartItems[index];
    
                        final confirm = await showConfirmDialog(
                          context: context,
                          title: "Remove item?",
                          message: "Are you sure you want to remove this item?",
                          enableUndo: true,
                          onUndo: () async {
                            cart.cartItems.insert(index, removedItem);
                            await cart.saveCart();
                            _isDeleted.insert(index, false);
                            setState(() {});
                          },
                        );
    
                        if (confirm == true) {
                          _isDeleted[index] = true;
                          setState(() {});
                          await Future.delayed(
                              const Duration(milliseconds: 300));
                          await cart.removeFromCart(index);
                          setState(() {});
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.close_rounded,
                            color: Colors.grey.shade700, size: 18),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  "\$${item['price']}",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Text(
                      "Size: ${item['size']}  |  Color: ",
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(item['color']),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _qtyButtons(item, index),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _qtyButtons(Map<String, dynamic> item, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () async {
              if (item['qty'] > 1) {
                item['qty']--;
              } else {
                cart.cartItems.removeAt(index);
              }
              await cart.saveCart();
              setState(() {});
            },
            child: const Icon(Icons.remove, size: 20),
          ),
          const SizedBox(width: 12),
          Text("${item['qty']}",
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: () async {
              item['qty']++;
              await cart.saveCart();
              setState(() {});
            },
            child: const Icon(Icons.add, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _rowInfo(String title, String value, {bool bold = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.grey.shade700,
              fontWeight: bold ? FontWeight.bold : FontWeight.w400,
            )),
        Text(value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: bold ? FontWeight.bold : FontWeight.w600,
            )),
      ],
    );
  }

  // 🔥 Dialog إعادة الاستخدام
  Future<bool?> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String message,
    String cancelText = "Cancel",
    String confirmText = "Remove",
    bool enableUndo = false,
    VoidCallback? onUndo,
    String undoLabel = "Undo",
  }) async {
    final result = await showDialog<bool>(
      context: context,
      barrierDismissible: true,
      barrierColor: Colors.black.withOpacity(.35),
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 12),
                Text(title,
                    style: AppStyles.semibold20, textAlign: TextAlign.center),
                const SizedBox(height: 10),
                Text(
                  message,
                  style: AppStyles.Regular14,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 22),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: BorderSide(color: Colors.grey.shade300),
                        ),
                      ),
                      child: Text(cancelText,
                          style: AppStyles.Regular14.copyWith(
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(width: 18),
                    ElevatedButton(
                      onPressed: () => Navigator.pop(context, true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 22, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(confirmText,
                          style: AppStyles.Regular14.copyWith(
                            color: Colors.white,
                          )),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );

    if (result == true && enableUndo && onUndo != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("$title done", style: const TextStyle(color: Colors.white)),
          duration: const Duration(seconds: 3),
          backgroundColor: Colors.black87,
          behavior: SnackBarBehavior.floating,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          action: SnackBarAction(
            label: undoLabel,
            textColor: Colors.white,
            onPressed: onUndo,
          ),
        ),
      );
    }

    return result;
  }
}