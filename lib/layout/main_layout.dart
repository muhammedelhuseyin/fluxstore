import 'package:flutter/material.dart';
import 'package:fluxstore/Discover/discover_screen.dart';
import 'package:fluxstore/cart/caer_screen.dart';
import 'package:fluxstore/home/home_screen.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int currentIndex = 0;
      final List<Widget> screens = [
      const HomeScreen(),
      const DiscoverScreen(),
      const CartScreen(),
      const Center(child: Text("Profile Page")),

    ];

  @override
  Widget build(BuildContext context) {
    // الصفحات اللي رح تتغير لما نضغط bottomNav


    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, -5), // ظل من الاعلى (خروج لفوق)
                ),
              ],
            ),
            child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Theme(
                  data: Theme.of(context).copyWith(
                    splashColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                  ),
                  child: BottomNavigationBar(
                    enableFeedback: false,
                    selectedItemColor: Colors.black,
                    unselectedItemColor: Colors.grey.withOpacity(0.6),
                    backgroundColor: Color(0xffffffff),
                    showSelectedLabels: false, // ← إخفاء النص المحدد
                    showUnselectedLabels: false, // ← إخفاء النص الغير المحدد

                    currentIndex: currentIndex,

                    onTap: (index) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_outlined),
                        label: "Home",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.search_outlined),
                        label: "search",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.shopping_cart_outlined),
                        label: "Cart",
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.person_2_outlined),
                        label: "Profile",
                      ),
                    ],
                  ),
                ))));
  }
}
